/*
 * GifRecorder - makes it easy to record a sketch in animated GIF
 * (c) 2014 cocopon.
 */
import gifAnimation.*;

/*
 * Usage:
 *
 * 0. Install a required library before using GifRecorder.
 *   http://extrapixel.github.io/gif-animation/
 *
 * 1. Put this file in the same folder as your sketch.
 *   + your_sketch/
 *   |-- your_sketch.pde
 *   |-- GifRecorder.pde
 *   |-- ...
 *
 * 2. Declare a recorder as a global variable.
 *   GifRecorder recorder = new GifRecorder(this);
 *
 * 3. Call GifRecorder#onDraw() at the end of draw().
 *   void draw() {
 *     ...
 *
 *     recorder.onDraw();
 *   }
 *
 * 4. Start recording in your preferred way.
 *   void mouseClicked() {
 *     recorder.recordForSeconds("out.gif", 10);
 *   }
 */
class GifRecorder {
  public static final int MIN_QUALITY = 1;
  public static final int MAX_QUALITY = 30;
  private static final int DEFAULT_FPS = 60;
  private static final int DEFAULT_QUALITY = 20;

  private int sketchFps_;
  private int timerCount_;
  private int frameCount_;
  private int totalFrames_;
  private int recInterval_;
  private int quality_;
  private PApplet applet_;
  private GifMaker maker_;

  /**
   * Constructs a recorder with specified parameters.
   * @param applet the applet.
   * @param sketchFps the FPS of the sketch.
   * @param recordingInterval the recording interval.
   * @param quality the quality of the output image.
   */
  public GifRecorder(PApplet applet, int sketchFps, int recordingInterval,
      int quality) {
    applet_ = applet;
    sketchFps_ = sketchFps;
    recInterval_ = recordingInterval;
    quality_ = quality;
  }

  /**
   * Constructs a recorder with specified parameters.
   * @param applet the applet.
   * @param sketchFps the FPS of the sketch.
   * @param recordingInterval the recording interval.
   */
  public GifRecorder(PApplet applet, int sketchFps, int recordingInterval) {
    this(applet, sketchFps, recordingInterval, DEFAULT_QUALITY);
  }

  /**
   * Constructs a recorder with default parameters.
   * @param applet the applet.
   */
  public GifRecorder(PApplet applet) {
    this(applet, DEFAULT_FPS, 1);
  }

  /**
   * Checks if the recorder is recording.
   * @return true if the recorder is recording.
   */
  public boolean isRecording() {
    return maker_ != null;
  }

  /**
   * Returns total seconds of the current recording.
   * @return the elapsed time.
   */
  public float getElapsedTime() {
    return totalFrames_ * recInterval_ / (float)sketchFps_;
  }

  /**
   * Starts recording.
   * @param path the output path.
   */
  public void start(String path) {
    finish();

    frameCount_ = 0;

    // GifMaker produces a better result with lower "quality"...why?
    // https://github.com/extrapixel/gif-animation/blob/master/gifAnimation/src/GifEncoder.java#L218
    int sample = min(max(MAX_QUALITY - quality_, MIN_QUALITY), MAX_QUALITY);
    maker_ = new GifMaker(applet_, path, sample);
    maker_.setDelay((int)(1000 / sketchFps_) * recInterval_);
    maker_.setRepeat(0);
  }

  /**
   * Records the sketch until specified frames.
   * @param path the output path.
   * @param totalFrames the total number of frames of the recording.
   */
  public void recordFrames(String path, int totalFrames) {
    start(path);
    timerCount_ = totalFrames;
  }

  /**
   * Records the sketch for specified seconds.
   * @param path the output path.
   * @param seconds the total duration of the recording.
   */
  public void recordForSeconds(String path, int seconds) {
    recordFrames(path, sketchFps_ * seconds);
  }

  /**
   * Appends the current frame to the file.
   * Call this method at the end of draw().
   */
  public void onDraw() {
    if (!isRecording()) {
      return;
    }

    if (frameCount_ == 0) {
      maker_.addFrame();
      ++totalFrames_;
    }

    ++frameCount_;
    if (frameCount_ >= recInterval_) {
      frameCount_ %= recInterval_;
    }

    if (timerCount_ > 0) {
      --timerCount_;

      if (timerCount_ == 0) {
        finish();
      }
    }
  }

  /**
   * Finishes the recording.
   */
  public void finish() {
    timerCount_ = -1;
    totalFrames_ = 0;

    if (!isRecording()) {
      return;
    }

    maker_.finish();
    maker_ = null;
  }
}
