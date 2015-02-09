/*
 * Easing.pde - brings Robert Penner's easing functions into Processing
 * (c) 2014 cocopon.
 *
 * See the following to learn more about these famous functions:
 * http://www.robertpenner.com/easing/
 *
 * License:
 * http://www.robertpenner.com/easing_terms_of_use.html
 */

/*
 * Usage:
 *
 * 1. Put this file in the same folder as your sketch.
 *   + your_sketch/
 *   |-- your_sketch.pde
 *   |-- Easing.pde
 *   |-- ...
 *
 * 2. Enjoy!
 *   // Easier way to use an easing function
 *   // (t: 0.0 ~ 1.0)
 *   float value = easeOutBack(t);
 *   ...
 *
 *   // You can also instanciate an easing function
 *   Easing easing = new EasingOutBack();
 *   float value = easing.get(t);
 *   ...
 */

class Easing {
  float get(float t) {
    return t;
  }
}

class EasingInBack extends Easing {
  float get(float t, float s) {
    return t * t * ((s + 1) * t - s);
  }

  float get(float t) {
    return get(t, 1.70158);
  }
}

class EasingInBounce extends Easing {
  float get(float t) {
    t = 1.0 - t;

    if (t < 1 / 2.75) {
      return 1.0 - (7.5625 * t * t);
    }
    if (t < 2 / 2.75) {
      t -= 1.5 / 2.75;
      return 1.0 - (7.5625 * t * t + 0.75);
    }
    if (t < 2.5 / 2.75) {
      t -= 2.25 / 2.75;
      return 1.0 - (7.5625 * t * t + 0.9375);
    }

    t -= 2.625 / 2.75;
    return 1.0 - (7.5625 * t * t + 0.984375);
  }
}

class EasingInCirc extends Easing {
  float get(float t) {
    return -(sqrt(1 - t * t) - 1);
  }
}

class EasingInCubic extends Easing {
  float get(float t) {
    return t * t * t;
  }
}

class EasingInElastic extends Easing {
  float get(float t, float s) {
    float p = 0.3;
    float a = 1.0;

    if (t == 0) {
      return 0;
    }
    if (t == 1.0) {
      return 1.0;
    }

    if (a < 1.0) {
      a = 1.0;
      s = p / 4;
    }
    else {
      s = p / (2 * 3.1419) * asin(1.0 / a);
    }

    --t;
    return -(a * pow(2, 10 * t) * sin((t - s) * (2 * 3.1419) / p));
  }

  float get(float t) {
    return get(t, 1.70158);
  }
}

class EasingInExpo extends Easing {
  float get(float t) {
    return (t == 0)
      ? 0 
      : pow(2, 10 * (t - 1));
  }
}

class EasingInQuad extends Easing {
  float get(float t) {
    return t * t;
  }
}

class EasingInQuart extends Easing {
  float get(float t) {
    return t * t * t * t;
  }
}

class EasingInQuint extends Easing {
  float get(float t) {
    return t * t * t * t * t;
  }
}

class EasingInSine extends Easing {
  float get(float t) {
    return -cos(t * (PI / 2)) + 1.0;
  }
}

class EasingOutBack extends Easing {
  float get(float t, float s) {
    --t;
    return t * t * ((s + 1.0) * t + s) + 1.0;
  }

  float get(float t) {
    return get(t, 1.70158);
  }
}

class EasingOutBounce extends Easing {
  float get(float t) {
    if (t < 1 / 2.75) {
      return 7.5625 * t * t;
    }
    if (t < 2 / 2.75) {
      t -= 1.5 / 2.75;
      return 7.5625 * t * t + 0.75;
    }
    if (t < 2.5 / 2.75) {
      t -= 2.25 / 2.75;
      return 7.5625 * t * t + 0.9375;
    }

    t -= 2.625 / 2.75;
    return 7.5625 * t * t + 0.984375;
  }
}

class EasingOutCirc extends Easing {
  float get(float t) {
    --t;
    return sqrt(1 - t * t);
  }
}

class EasingOutCubic extends Easing {
  float get(float t) {
    --t;
    return t * t * t + 1;
  }
}

class EasingOutElastic extends Easing {
  float get(float t, float s) {
    float p = 0.3;
    float a = 1.0;

    if (t == 0) {
      return 0;
    }
    if (t == 1.0) {
      return 1.0;
    }

    if (a < 1.0) {
      a = 1.0;
      s = p / 4;
    }
    else {
      s = p / (2 * 3.1419) * asin(1.0 / a);
    }
    return a * pow(2, -10 * t) * sin((t - s) * (2 * 3.1419) / p) + 1.0;
  }

  float get(float t) {
    return get(t, 1.70158);
  }
}

class EasingOutExpo extends Easing {
  float get(float t) {
    return (t == 1.0)
      ? 1.0
      : (-pow(2, -10 * t) + 1);
  }
}

class EasingOutQuad extends Easing {
  float get(float t) {
    return -t * (t - 2);
  }
}

class EasingOutQuart extends Easing {
  float get(float t) {
    --t;
    return 1.0 - t * t * t * t;
  }
}

class EasingOutQuint extends Easing {
  float get(float t) {
    --t;
    return t * t * t * t * t + 1;
  }
}

class EasingOutSine extends Easing {
  float get(float t) {
    return sin(t * (PI / 2));
  }
}

class EasingInOutBack extends Easing {
  float get(float t, float s) {
    float k = 1.525;

    t *= 2;
    s *= k;

    if (t < 1) {
      return 0.5 * (t * t * ((s + 1) * t - s));
    }
    t -= 2;
    return 0.5 * (t * t * ((s + 1) * t + s) + 2);
  }

  float get(float t) {
    return get(t, 1.70158);
  }
}

class EasingInOutBounce extends Easing {
  Easing inBounce_ = new EasingInBounce();
  Easing outBounce_ = new EasingOutBounce();

  float get(float t) {
    return (t < 0.5)
      ? (inBounce_.get(t * 2) * 0.5)
      : (outBounce_.get(t * 2 - 1.0) * 0.5 + 0.5);
  }
}

class EasingInOutCirc extends Easing {
  float get(float t) {
    t *= 2;

    if (t < 1) {
      return -0.5 * (sqrt(1 - t * t) - 1);
    }

    t -= 2;
    return 0.5 * (sqrt(1 - t * t) + 1);
  }
}

class EasingInOutCubic extends Easing {
  float get(float t) {
    t *= 2;

    if (t < 1) {
      return 0.5 * t * t * t;
    }

    t -= 2;
    return 0.5 * (t * t * t + 2);
  }
}

class EasingInOutElastic extends Easing {
  float get(float t, float s) {
    float p =  0.3 * 1.5;
    float a = 1.0;

    if (t == 0) {
      return 0;
    }
    if (t == 1.0) {
      return 1.0;
    }

    if (a < 1.0) {
      a = 1.0;
      s = p / 4;
    }
    else {
      s = p / (2 * 3.1419) * asin(1.0 / a);
    }

    if (t < 1) {
      --t;
      return -0.5 * (a * pow(2, 10 * t) * sin((t - s) * (2 * 3.1419) / p));
    }
    --t;
    return a * pow(2, -10 * t) * sin((t - s) * (2 * 3.1419) / p) * 0.5 + 1.0;
  }

  float get(float t) {
    return get(t, 1.70158);
  }
}

class EasingInOutExpo extends Easing {
  float get(float t) {
    if (t == 0) {
      return 0;
    }
    if (t == 1.0) {
      return 1.0;
    }

    t *= 2;
    if (t < 1) {
      return 0.5 * pow(2, 10 * (t - 1));
    }

    --t;
    return 0.5 * (-pow(2, -10 * t) + 2);
  }
}

class EasingInOutQuad extends Easing {
  float get(float t) {
    t *= 2;

    if (t < 1) {
      return 0.5 * t * t;
    }

    --t;
    return -0.5 * (t * (t - 2) - 1);
  }
}

class EasingInOutQuart extends Easing {
  float get(float t) {
    t *= 2;

    if (t < 1) {
      return 0.5 * t * t * t * t;
    }

    t -= 2;
    return -0.5 * (t * t * t * t - 2);
  }
}

class EasingInOutQuint extends Easing {
  float get(float t) {
    t *= 2;

    if (t < 1) {
      return 0.5 * t * t * t * t * t;
    }

    t -= 2;
    return 0.5 * (t * t * t * t * t + 2);
  }
}

class EasingInOutSine extends Easing {
  float get(float t) {
    return -0.5 * (cos(PI * t) - 1);
  }
}

Easing inBack__    = new EasingInBack();
Easing inBounce__  = new EasingInBounce();
Easing inCirc__    = new EasingInCirc();
Easing inCubic__   = new EasingInCubic();
Easing inElastic__ = new EasingInElastic();
Easing inExpo__    = new EasingInExpo();
Easing inQuad__    = new EasingInQuad();
Easing inQuart__   = new EasingInQuart();
Easing inQuint__   = new EasingInQuint();
Easing inSine__    = new EasingInSine();

Easing outBack__    = new EasingOutBack();
Easing outBounce__  = new EasingOutBounce();
Easing outCirc__    = new EasingOutCirc();
Easing outCubic__   = new EasingOutCubic();
Easing outElastic__ = new EasingOutElastic();
Easing outExpo__    = new EasingOutExpo();
Easing outQuad__    = new EasingOutQuad();
Easing outQuart__   = new EasingOutQuart();
Easing outQuint__   = new EasingOutQuint();
Easing outSine__    = new EasingOutSine();

Easing inOutBack__    = new EasingInOutBack();
Easing inOutBounce__  = new EasingInOutBounce();
Easing inOutCirc__    = new EasingInOutCirc();
Easing inOutCubic__   = new EasingInOutCubic();
Easing inOutElastic__ = new EasingInOutElastic();
Easing inOutExpo__    = new EasingInOutExpo();
Easing inOutQuad__    = new EasingInOutQuad();
Easing inOutQuart__   = new EasingInOutQuart();
Easing inOutQuint__   = new EasingInOutQuint();
Easing inOutSine__    = new EasingInOutSine();

float easeInBack(float t, float s) {
  return ((EasingInBack)inBack__).get(t, s);
}

float easeInBack(float t) {
  return inBack__.get(t);
}

float easeInBounce(float t) {
  return inBounce__.get(t);
}

float easeInCirc(float t) {
  return inCirc__.get(t);
}

float easeInCubic(float t) {
  return inCubic__.get(t);
}

float easeInElastic(float t, float s) {
  return ((EasingInElastic)inElastic__).get(t, s);
}

float easeInElastic(float t) {
  return inElastic__.get(t);
}

float easeInExpo(float t) {
  return inExpo__.get(t);
}

float easeInQuad(float t) {
  return inQuad__.get(t);
}

float easeInQuart(float t) {
  return inQuart__.get(t);
}

float easeInQuint(float t) {
  return inQuint__.get(t);
}

float easeInSine(float t) {
  return inSine__.get(t);
}

float easeOutBack(float t, float s) {
  return ((EasingOutBack)outBack__).get(t, s);
}

float easeOutBack(float t) {
  return outBack__.get(t);
}

float easeOutBounce(float t) {
  return outBounce__.get(t);
}

float easeOutCirc(float t) {
  return outCirc__.get(t);
}

float easeOutCubic(float t) {
  return outCubic__.get(t);
}

float easeOutElastic(float t, float s) {
  return ((EasingOutElastic)outElastic__).get(t, s);
}

float easeOutElastic(float t) {
  return outElastic__.get(t);
}

float easeOutExpo(float t) {
  return outExpo__.get(t);
}

float easeOutQuad(float t) {
  return outQuad__.get(t);
}

float easeOutQuart(float t) {
  return outQuart__.get(t);
}

float easeOutQuint(float t) {
  return outQuint__.get(t);
}

float easeOutSine(float t) {
  return outSine__.get(t);
}

float easeInOutBack(float t, float s) {
  return ((EasingInOutBack)inOutBack__).get(t, s);
}

float easeInOutBack(float t) {
  return inOutBack__.get(t);
}

float easeInOutBounce(float t) {
  return inOutBounce__.get(t);
}

float easeInOutCirc(float t) {
  return inOutCirc__.get(t);
}

float easeInOutCubic(float t) {
  return inOutCubic__.get(t);
}

float easeInOutElastic(float t, float s) {
  return ((EasingInOutElastic)inOutElastic__).get(t, s);
}

float easeInOutElastic(float t) {
  return inOutElastic__.get(t);
}

float easeInOutExpo(float t) {
  return inOutExpo__.get(t);
}

float easeInOutQuad(float t) {
  return inOutQuad__.get(t);
}

float easeInOutQuart(float t) {
  return inOutQuart__.get(t);
}

float easeInOutQuint(float t) {
  return inOutQuint__.get(t);
}

float easeInOutSine(float t) {
  return inOutSine__.get(t);
}
