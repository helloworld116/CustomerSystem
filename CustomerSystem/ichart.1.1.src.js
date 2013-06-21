 (function(c) {
  var a = navigator.userAgent.toLowerCase(), b = Object.prototype.toString, d = /opera/.test(a), e = /\bchrome\b/.test(a), f = /webkit/.test(a), g = !e && /safari/.test(a), i = !d && /msie/.test(a), j = !!document.createElement("canvas").getContext, k = !f && /gecko/.test(a), o = /ipod|ipad|iphone|android/gi.test(a), l = function(a, b, d, h) {
  return d * a / h + b
  }, q = {easeIn: function(a, b, d, h) {
  return d * (a /= h) * a * a + b
  },easeOut: function(a, b, d, h) {
  return d * ((a = a / h - 1) * a * a + 1) + b
  },easeInOut: function(a, b, d, h) {
  return 1 > (a /= h / 2) ? d / 2 * a * a * a + b : d / 2 * ((a -= 2) * a * a + 2) + b
  }}, m = function(a) {
  var c = !1, u = !1, h = [], s = function() {
  if (document.addEventListener)
  return function() {
  document.removeEventListener("DOMContentLoaded", s, !1);
  w()
  };
  if (document.attachEvent)
  return function() {
  "complete" === document.readyState && (document.detachEvent("onreadystatechange", s), w())
  }
  }(), v = function() {
  if (!c) {
  try {
  document.documentElement.doScroll("left")
  } catch (a) {
  setTimeout(v, 1);
  return
  }
  w()
  }
  }, w = function() {
  if (!c) {
  c = !0;
  for (var a = 0; a < h.length; a++)
  h[a].call(document);
  h = []
  }
  }, x = function() {
  if (!u) {
  u = !0;
  if ("complete" === document.readyState)
  return setTimeout(w, 1);
  if (document.addEventListener)
  document.addEventListener("DOMContentLoaded", s, !1), a.addEventListener("load", w, !1);
  else if (document.attachEvent) {
  document.attachEvent("onreadystatechange", s);
  a.attachEvent("onload", w);
  var h = !1;
  try {
  h = null == a.frameElement
  } catch (b) {
  }
  document.documentElement.doScroll && h && v()
  }
  }
  }, Q = function(a) {
  x();
  c ? a.call(document, p) : h.push(function() {
                                   return a.call(this)
                                   })
  }, p = function(a) {
  if (!a || a.nodeType)
  return a;
  if ("string" === typeof a)
  return -1 != a.indexOf("#") && (a = a.substring(1)), document.getElementById(a);
  "function" === typeof a && Q(a)
  };
  p.apply = function(a, h) {
  if (a && h && "object" == typeof h)
  for (var b in h)
  "undefined" != typeof h[b] && (a[b] = h[b]);
  if (!h && a) {
  var d = {};
  for (b in a)
  d[b] = a[b];
  return d
  }
  return a
  };
  p.apply(p, {version: "1.0",email: "taylor@ichartjs.com",isEmpty: function(a, h) {
          return null === a || void 0 === a || p.isArray(a) && !a.length || (!h ? "" === a : !1)
          },isArray: function(a) {
          return "[object Array]" === b.apply(a)
          },isDate: function(a) {
          return "[object Date]" === b.apply(a)
          },isObject: function(a) {
          return !!a && "[object Object]" === b.apply(a)
          },isFunction: function(a) {
          return "[object Function]" === b.apply(a)
          },isNumber: function(a) {
          return "number" === typeof a && isFinite(a)
          },isString: function(a) {
          return "string" === typeof a
          },isBoolean: function(a) {
          return "boolean" === typeof a
          },isFalse: function(a) {
          return "boolean" === typeof a && !a
          },isElement: function(a) {
          return a ? !!a.tagName : !1
          },isDefined: function(a) {
          return "undefined" !== typeof a
          }});
  p.applyIf = function(a, h) {
  if (a && p.isObject(h))
  for (var b in h)
  p.isDefined(h[b]) && !p.isDefined(a[b]) && (a[b] = h[b]);
  return !h && a ? p.apply(a) : a
  };
  p.merge = function(a, h, b) {
  if (a && p.isObject(h)) {
  for (var d in h)
  p.isDefined(h[d]) && (p.isObject(h[d]) ? p.isObject(a[d]) ? p.merge(a[d], h[d]) : a[d] = p.clone(h[d], !0) : a[d] = h[d]);
  if (p.isObject(b))
  return p.merge(a, b)
  }
  return a
  };
  p.clone = function(a, h, b) {
  var d = {};
  if (p.isArray(a) && p.isObject(h))
  for (var c = 0; c < a.length; c++)
  d[a[c]] = b && p.isObject(h[a[c]]) ? p.clone(h[a[c]], b) : h[a[c]];
  else if (p.isObject(a))
  for (c in a)
  d[c] = h && p.isObject(a[c]) && !a[c].ICHARTJS_OBJECT ? p.clone(a[c], h) : a[c];
  return d
  };
  p.override = function(a, h) {
  if (a && h) {
  var b = a.prototype;
  p.apply(b, h);
  p.isIE && h.hasOwnProperty("toString") && (b.toString = h.toString)
  }
  };
  p.extend = function() {
  var a = function(a) {
  for (var h in a)
  this[h] = a[h]
  }, h = Object.prototype.constructor;
  return function(b, d) {
  var c = function() {
  b.apply(this, arguments)
  }, s = function() {
  }, e = b.prototype;
  s.prototype = e;
  s = c.prototype = new s;
  s.constructor = c;
  c.superclass = e;
  e.constructor == h && (e.constructor = b);
  c.override = function(a) {
  p.override(c, a)
  };
  s.superclass = s.supr = function() {
  return e
  };
  s.override = a;
  p.override(c, d);
  c.extend = function(a) {
  return p.extend(c, a)
  };
  c.plugin_ = {};
  c.plugin = function(a, h) {
  p.isString(a) && p.isFunction(h) && (c.plugin_[a] = h)
  };
  return c
  }
  }();
  var D = Math.sin, G = Math.cos, n = Math.atan, R = Math.sqrt, H = Math.abs, y = Math.PI, A = 2 * y, I = Math.ceil, B = Math.round, E = Math.floor, J = Math.max, K = Math.min, z = parseFloat, C = {}, L = function(a, h) {
  if (0 == a)
  return a;
  var b = H(a), d = 0.1;
  if (1 < b) {
  for (; 1 < b; )
  b /= 10, d *= 10;
  return E(a / d + h) * d
  }
  for (d = 1; 1 > b; )
  b *= 10, d *= 10;
  return B(a * d + h) / d
  }, M = {navy: "rgb(0,0,128)",olive: "rgb(128,128,0)",orange: "rgb(255,165,0)",silver: "rgb(192,192,192)",white: "rgb(255,255,255)",gold: "rgb(255,215,0)",lime: "rgb(0,255,0)",fuchsia: "rgb(255,0,255)",aqua: "rgb(0,255,255)",green: "rgb(0,128,0)",gray: "rgb(80,80,80)",red: "rgb(255,0,0)",blue: "rgb(0,0,255)",pink: "rgb(255,192,203)",purple: "rgb(128,0,128)",yellow: "rgb(255,255,0)",maroon: "rgb(128,0,0)",black: "rgb(0,0,0)",azure: "rgb(240,255,255)",beige: "rgb(245,245,220)",brown: "rgb(165,42,42)",cyan: "rgb(0,255,255)",darkblue: "rgb(0,0,139)",darkcyan: "rgb(0,139,139)",darkgrey: "rgb(169,169,169)",darkgreen: "rgb(0,100,0)",darkkhaki: "rgb(189,183,107)",darkmagenta: "rgb(139,0,139)",darkolivegreen: "rgb(85,107,47)",darkorange: "rgb(255,140,0)",darkorchid: "rgb(153,50,204)",darkred: "rgb(139,0,0)",darksalmon: "rgb(233,150,122)",darkviolet: "rgb(148,0,211)",indigo: "rgb(75,0,130)",khaki: "rgb(240,230,140)",lightblue: "rgb(173,216,230)",lightcyan: "rgb(224,255,255)",lightgreen: "rgb(144,238,144)",lightgrey: "rgb(211,211,211)",lightpink: "rgb(255,182,193)",lightyellow: "rgb(255,255,224)",magenta: "rgb(255,0,255)",violet: "rgb(128,0,128)"}, N = function(a) {
  var h = /rgb\((\w*),(\w*),(\w*)\)/.exec(a);
  if (h)
  return [h[1], h[2], h[3]];
  if (h = /rgba\((\w*),(\w*),(\w*),(.*)\)/.exec(a))
  return [h[1], h[2], h[3], h[4]];
  throw Error("invalid colors value '" + a + "'");
  }, F = function(a) {
  if (!a)
  return a;
  a = a.replace(/\s/g, "").toLowerCase();
  if (/^rgb\([0-9]{1,3},[0-9]{1,3},[0-9]{1,3}\)$/.exec(a) || /^rgba\([0-9]{1,3},[0-9]{1,3},[0-9]{1,3},(0(\.[0-9])?|1(\.0)?)\)$/.exec(a))
  return a;
  if (/^#(([a-fA-F0-9]{6,7})|([a-fA-F0-9]{3}))$/.exec(a))
  return a = a.replace(/#/g, "").replace(/^(\w)(\w)(\w)$/, "$1$1$2$2$3$3"), (7 == a.length ? "rgba(" : "rgb(") + parseInt(a.substring(0, 2), 16) + "," + parseInt(a.substring(2, 4), 16) + "," + parseInt(a.substring(4, 6), 16) + (7 == a.length ? ",0." + a.substring(6, 7) + ")" : ")");
  if (M[a])
  return M[a];
  throw Error("invalid colors value '" + a + "'");
  }, O = function(a, h) {
  h = h || 0.14;
  return 0.5 < a ? h - (1 - a) / 10 : 0.1 < a ? h - 0.16 + a / 5 : a > h ? h : a / 2
  }, P = function(a, h, b, d) {
  if (!h)
  return h;
  var h = N(F(h)), c;
  c = h;
  var s = void 0, e = void 0;
  p.isArray(c) && (s = c[1], e = c[2], c = c[0]);
  c /= 255;
  var s = s / 255, e = e / 255, f = J(J(c, s), e), g = K(K(c, s), e), g = f - g;
  if (0 == g)
  c = [0, 0, f];
  else {
  var v;
  c == f ? v = (s - e) / g : s == f ? v = (e - c) / g + 2 : e == f && (v = (c - s) / g + 4);
  v *= 60;
  0 > v && (v += 360);
  c = [v, g / f, f]
  }
  c[1] -= 0 != d ? d || 0.05 : d;
  a ? (c[2] -= O(c[2], b), c[1] = p.upTo(c[1], 1), c[2] = p.lowTo(c[2], 0)) : (c[2] += O(1 - c[2], b), c[1] = p.lowTo(c[1], 0), c[2] = p.upTo(c[2], 1));
  d = h[3];
  a = h = void 0;
  p.isArray(c) && (a = d, d = c[1], h = c[2], c = c[0]);
  var w, j, i, b = E(c / 60) % 6, e = c / 60 - b;
  c = h * (1 - d);
  s = h * (1 - d * e);
  d = h * (1 - d * (1 - e));
  switch (b) {
  case 0:
  w = h;
  j = d;
  i = c;
  break;
  case 1:
  w = s;
  j = h;
  i = c;
  break;
  case 2:
  w = c;
  j = h;
  i = d;
  break;
  case 3:
  w = c;
  j = s;
  i = h;
  break;
  case 4:
  w = d;
  j = c;
  i = h;
  break;
  case 5:
  w = h, j = c, i = s
  }
  return "rgb" + (a ? "a" : "") + "(" + B(255 * w) + "," + B(255 * j) + "," + B(255 * i) + (a ? "," + a + ")" : ")")
  };
  p.apply(p, {getFont: function(a, h, b) {
          return a + " " + h + "px " + b
          },getDoc: function() {
          return a.contentWindow ? a.contentWindow.document : a.contentDocument ? a.contentDocument : a.document
          },DefineAbstract: function(a, h) {
          if (!h[a])
          throw Error("Cannot instantiate the type '" + h.type + "'.you must implements it with method '" + a + "'.");
          },getAA: function(a) {
          return "linear" == a ? l : "easeInOut" == a || "easeIn" == a || "easeOut" == a ? q[a] : l
          },noConflict: function() {
          return m
          },plugin: function(a, h, b) {
          p.isFunction(a) && a.plugin(h, b)
          },parsePadding: function(a, h) {
          a = a || 0;
          if (p.isNumber(a))
          return [a, a, a, a];
          if (p.isArray(a))
          return a;
          h = h || 0;
          a = a.replace(/^\s+|\s+$/g, "").replace(/\s{2,}/g, /\s/).replace(/\s/g, ",").split(",");
          1 == a.length ? a[0] = a[1] = a[2] = a[3] = z(a[0]) || h : 2 == a.length ? (a[0] = a[2] = z(a[0]) || h, a[1] = a[3] = z(a[1]) || h) : 3 == a.length ? (a[0] = z(a[0]) || h, a[1] = a[3] = z(a[1]) || h, a[2] = z(a[2]) || h) : (a[0] = z(a[0]) || h, a[1] = z(a[1]) || h, a[2] = z(a[2]) || h, a[3] = z(a[3]) || h);
          return a
          },distanceP2P: function(a, h, b, c) {
          return R((b - a) * (b - a) + (c - h) * (c - h))
          },atan2Radian: function(a, h, b, c) {
          if (a == b)
          return c > h ? y / 2 : 3 * y / 2;
          if (h == c)
          return b > a ? 0 : y;
          var d = p.quadrant(a, h, b, c), a = n(H((h - c) / (a - b)));
          return d ? (3 == d ? A : y) + (2 == d ? a : -a) : a
          },angle2Radian: function(a) {
          return a * y / 180
          },radian2Angle: function(a) {
          return 180 * a / y
          },quadrant: function(a, h, b, c) {
          return a < b ? h < c ? 0 : 3 : h < c ? 1 : 2
          },toPI2: function(a) {
          for (; 0 > a; )
          a += A;
          return a
          },visible: function(a, h, b) {
          if (a >= h)
          return [];
          var c = p.quadrantd(a), d = p.quadrantd(h);
          if ((2 == c || 3 == c) && (2 == d || 3 == d) && h - a < y)
          return [];
          a = p.toPI2(a);
          h = p.toPI2(h);
          h <= a && (h += A);
          if (a > y)
          a = A;
          else {
          if (h > A)
          return [{s: a,e: y,f: b}, {s: A,e: h,f: b}];
          h > y && (h = y)
          }
          return {s: a,e: h,f: b}
          },quadrantd: function(a) {
          if (0 == a)
          return 0;
          if (0 == a % A)
          return 3;
          for (; 0 > a; )
          a += A;
          return I(2 * (a % A) / y) - 1
          },upTo: function(a, h) {
          return h > a ? a : h
          },lowTo: function(a, h) {
          return h < a ? a : h
          },between: function(a, h, b) {
          return a > h ? p.between(h, a, b) : b > h ? h : b < a ? a : b
          },inRange: function(a, h, b) {
          return h > b && a < b
          },angleInRange: function(a, h, b) {
          b -= a;
          b = 0 > b ? b + A : b;
          b %= A;
          return h - a > b
          },angleZInRange: function(a, h, b) {
          return h > a ? h > b && a < b : b > a || b < h
          },inRangeClosed: function(a, h, b) {
          return h >= b && a <= b
          },inEllipse: function(a, h, b, c) {
          return 1 >= a * a / b / b + h * h / c / c
          },p2Point: function(a, h, b, c) {
          return {x: a + G(b) * c,y: h + D(b) * c}
          },toRgb: F,toRgba: function(a, h) {
          var b = N(F(a));
          return "rgba(" + b[0] + "," + b[1] + "," + b[2] + "," + h + ")"
          },vectorP2P: function(a, h, b) {
          b || (h = p.angle2Radian(h), a = p.angle2Radian(a));
          h = D(h);
          return {x: h * D(a),y: h * G(a)}
          },uid: function(a) {
          return (a || "ichartjs") + "_" + I(1E4 * Math.random()) + (new Date).getTime().toString().substring(4)
          },register: function(a) {
          var h = a.get("id");
          if (!h || "" == h) {
          for (h = p.uid(a.type); C[h]; )
          h = p.uid(a.type);
          a.push("id", h)
          }
          if (C[h])
          throw Error("exist reduplicate id :" + h);
          a.id = h;
          C[h] = a
          },get: function(a) {
          return C[a]
          },parsePercent: function(a, h) {
          p.isString(a) && (a = a.match(/(.*)%/)) && (a = h ? E(z(a[1]) * h / 100) : a[1] / 100);
          return !a || 0 >= a || a > h ? h : a
          },parseFloat: function(a, h) {
          if (!p.isNumber(a) && (a = z(a), !p.isNumber(a)))
          throw Error("[" + h + "]=" + a + "is not a valid number.");
          return a
          },ceil: function(a) {
          return L(a, 1)
          },floor: function(a) {
          return L(a, -1)
          },_2D: "2d",_3D: "3d",light: function(a, h, b) {
          return P(!1, a, h, b)
          },dark: function(a, h, b) {
          return P(!0, a, h, b)
          },fixPixel: function(a) {
          return p.isNumber(a) ? a : z(a.replace("px", "")) || 0
          },toPixel: function(a) {
          return p.isNumber(a) ? a + "px" : p.fixPixel(a) + "px"
          },emptyFn: function() {
          return !0
          },supportCanvas: j,isOpera: d,isWebKit: f,isChrome: e,isSafari: g,isIE: i,isGecko: k,isMobile: o,touch: "ontouchend" in document,FRAME: o ? 30 : 60});
  p.Assert = {isTrue: function(a, h) {
  if (!0 !== a)
  throw Error(h);
  }};
  p.requestAnimFrame = function() {
  var h = a.requestAnimationFrame || a.webkitRequestAnimationFrame || a.mozRequestAnimationFrame || a.oRequestAnimationFrame || a.msRequestAnimationFrame || function(h) {
  a.setTimeout(h, 1E3 / 60)
  };
  return function(a) {
  h(a)
  }
  }();
  p.Event = {addEvent: function(a, h, b, c) {
  a.addEventListener ? a.addEventListener(h, b, c) : a.attachEvent ? a.attachEvent("on" + h, b) : a["on" + h] = b
  },fix: function(h) {
  "undefined" == typeof h && (h = a.event);
  var b = {target: h.target,pageX: h.pageX,pageY: h.pageY,offsetX: h.offsetX,offsetY: h.offsetY,stopPropagation: !1,event: h};
  if ("undefined" == typeof h.offsetX) {
  h.target || (b.target = h.srcElement || document);
  h.targetTouches && (b.pageX = h.targetTouches[0].pageX, b.pageY = h.targetTouches[0].pageY);
  if (null == b.pageX && null != h.clientX) {
  var c = document.documentElement, d = document.body;
  b.pageX = h.clientX + (c && c.scrollLeft || d && d.scrollLeft || 0) - (c && c.clientLeft || d && d.clientLeft || 0);
  b.pageY = h.clientY + (c && c.scrollTop || d && d.scrollTop || 0) - (c && c.clientTop || d && d.clientTop || 0)
  }
  for (var d = c = 0, s = h.target; s != document.body && s; )
  c += s.offsetLeft, d += s.offsetTop, s = s.offsetParent;
  b.offsetX = b.pageX - c;
  b.offsetY = b.pageY - d
  }
  b.x = b.offsetX;
  b.y = b.offsetY;
  h.stopPropagation || (h.stopPropagation = function() {
                        a.event.cancelBubble = true
                        });
  return b
  }};
  return p
  }(c);
  Array.prototype.each = function(a, b) {
  for (var c = this.length, h, d = 0; d < c && !(h = b ? a.call(b, this[d], d) : a(this[d], d), "boolean" === typeof h && !h); d++)
  ;
  return this
  };
  Array.prototype.eachAll = function(a, b) {
  this.each(function(c, h) {
            return m.isArray(c) ? c.eachAll(a, b) : b ? a.call(b, c, h) : a(c, h)
            }, b)
  };
  Array.prototype.sor = function(a) {
  for (var b = this.length - 1, c, h = 0; h < b; h++)
  for (var d = b; d > h; d--)
  if (a ? !a(this[d], this[d - 1]) : this[d] < this[d - 1])
  c = this[d], this[d] = this[d - 1], this[d - 1] = c
  };
  c.iChart = m;
  c.$ || (c.$ = c.iChart)
  })(window);
(function(c) {
 c.Element = function(a) {
 var b = this._();
 b.type = "element";
 b.ICHARTJS_OBJECT = !0;
 c.DefineAbstract("configure", b);
 c.DefineAbstract("afterConfiguration", b);
 b.options = {};
 b.set({border: {enable: !1,color: "#BCBCBC",style: "solid",width: 1,radius: 0},shadow: !1,shadow_color: "#666666",shadow_blur: 4,shadow_offsetx: 0,shadow_offsety: 0});
 b.W = "width";
 b.H = "height";
 b.O = "top";
 b.B = "bottom";
 b.L = "left";
 b.R = "right";
 b.C = "center";
 b.X = "originx";
 b.Y = "originy";
 b.variable = {};
 b.events = {mouseup: [],touchstart: [],touchmove: [],touchend: [],mousedown: [],dblclick: []};
 b.registerEvent("initialize");
 b.initialization = !1;
 b.configure.apply(b, Array.prototype.slice.call(arguments, 1));
 b.default_ = c.clone(b.options, !0);
 b.set(a);
 b.afterConfiguration(b)
 };
 c.Element.prototype = {_: function() {
 return this
 },afterConfiguration: function(a) {
 if (c.isObject(a.get("listeners")))
 for (var b in a.get("listeners"))
 a.on(b, a.get("listeners")[b]);
 a.initialize();
 a.fireEvent(a, "initialize", [a])
 },registerEvent: function() {
 for (var a = 0; a < arguments.length; a++)
 this.events[arguments[a]] = []
 },fireString: function(a, b, d, e) {
 a = this.fireEvent(a, b, d);
 return c.isString(a) ? a : !0 !== a && c.isDefined(a) ? a.toString() : e
 },fireEvent: function(a, b, c) {
 var e = this.events[b].length;
 if (1 == e)
 return this.events[b][0].apply(a, c);
 for (var f = !0, g = 0; g < e; g++)
 this.events[b][g].apply(a, c) || (f = !1);
 return f
 },on: function(a, b) {
 c.isString(a) && c.isArray(this.events[a]) ? this.events[a].push(b) : c.isArray(a) && a.each(function(a) {
                                                                                              this.on(a, b)
                                                                                              }, this);
 return this
 },getPlugin: function(a) {
 return this.constructor.plugin_[a]
 },set: function(a) {
 c.isObject(a) && c.merge(this.options, a)
 },pushIf: function(a, b) {
 return !c.isDefined(this.get(a)) || null == this.get(a) ? this.push(a, b) : this.get(a)
 },push: function(a, b) {
 for (var c = a.split("."), e = c.length - 1, f = this.options, g = 0; g < e; g++)
 f[c[g]] || (f[c[g]] = {}), f = f[c[g]];
 return f[c[e]] = b
 },get: function(a) {
 for (var a = a.split("."), b = this.options[a[0]], c = 1; c < a.length; c++) {
 if (!b)
 return null;
 b = b[a[c]]
 }
 return b
 }};
 c.Painter = c.extend(c.Element, {configure: function() {
                      this.type = "painter";
                      this.dimension = c._2D;
                      c.DefineAbstract("commonDraw", this);
                      c.DefineAbstract("initialize", this);
                      this.set({strokeStyle: "gray",padding: 10,color: "black",offsetx: 0,offsety: 0,background_color: "#FEFEFE",color_factor: 0.15,style: "",border: {enable: !0},gradient: !1,gradient_mode: "LinearGradientUpDown",z_index: 0,listeners: null,originx: null,originy: null});
                      this.variable.event = {mouseover: !1};
                      this.variable.animation = {};
                      this.registerEvent("click", "mousemove", "mouseover", "mouseout", "beforedraw", "draw")
                      },is3D: function() {
                      return this.dimension == c._3D
                      },applyGradient: function(a, b, c, e) {
                      var f = this._();
                      f.get("gradient") && f.get("f_color") && (f.push("f_color", f.T.gradient(a || f.x || 0, b || f.y || 0, c || f.get(f.W), e || f.get(f.H), [f.get("dark_color"), f.get("light_color")], f.get("gradient_mode"))), f.push("light_color", f.T.gradient(a || f.x || 0, b || f.y || 0, c || f.get(f.W), e || f.get(f.H), [f.get("background_color"), f.get("light_color")], f.get("gradient_mode"))), f.push("f_color_", f.get("f_color")))
                      },draw: function(a, b) {
                      if (b)
                      this.root.draw(a);
                      else {
                      if (!this.fireEvent(this, "beforedraw", [this, a]))
                      return this;
                      this.commonDraw(this, a);
                      this.fireEvent(this, "draw", [this, a])
                      }
                      },inject: function(a) {
                      a && (this.root = a, this.target = this.T = a.T)
                      },doConfig: function() {
                      var a = this._(), b = c.parsePadding(a.get("padding")), d = a.get("border.enable"), d = d ? c.parsePadding(a.get("border.width")) : [0, 0, 0, 0], e = c.toRgb(a.get("background_color")), f = a.get("color_factor"), g = a.get("gradient") ? 0 : null;
                      a.set({border_top: d[0],border_right: d[1],border_bottom: d[2],border_left: d[3],hborder: d[1] + d[3],vborder: d[0] + d[2],padding_top: b[0] + d[0],padding_right: b[1] + d[1],padding_bottom: b[2] + d[2],padding_left: b[3] + d[3],hpadding: b[1] + b[3] + d[1] + d[3],vpadding: b[0] + b[2] + d[0] + d[2]});
                      !0 === a.get("shadow") && a.push("shadow", {color: a.get("shadow_color"),blur: a.get("shadow_blur"),offsetx: a.get("shadow_offsetx"),offsety: a.get("shadow_offsety")});
                      a.push("f_color", e);
                      a.push("f_color_", e);
                      a.push("light_color", c.light(e, f, g));
                      a.push("dark_color", c.dark(e, 0.8 * f, g));
                      a.push("light_color2", c.light(e, 2 * f, g));
                      a.is3D() && !a.get("xAngle_") && (b = c.vectorP2P(a.get("xAngle"), a.get("yAngle")), a.push("xAngle_", b.x), a.push("yAngle_", b.y))
                      }});
 c.Html = c.extend(c.Element, {configure: function(a) {
                   this.type = "html";
                   this.T = a;
                   c.DefineAbstract("beforeshow", this);
                   this.set({animation: !0,default_action: !0,width: 0,height: 0,style: "",index: 999,offset_top: 0,offset_left: 0});
                   this.transitions = ""
                   },initialize: function() {
                   var a = this._();
                   a.wrap = a.get("wrap");
                   a.dom = document.createElement("div");
                   a.get("shadow") && a.css("boxShadow", a.get("shadow_offsetx") + "px " + a.get("shadow_offsety") + "px " + a.get("shadow_blur") + "px " + a.get("shadow_color"));
                   a.get("border.enable") && (a.css("border", a.get("border.width") + "px " + a.get("border.style") + " " + a.get("border.color")), a.css("borderRadius", a.get("border.radius") + "px"));
                   a.css("position", "absolute");
                   a.css("zIndex", a.get("index"));
                   a.applyStyle();
                   a.wrap.appendChild(a.dom);
                   a.style = a.dom.style;
                   a.get("default_action") && a.doAction(a)
                   },width: function() {
                   return this.dom.offsetWidth
                   },height: function() {
                   return this.dom.offsetHeight
                   },onTransitionEnd: function(a, b) {
                   var d = "transitionend";
                   c.isWebKit ? d = "webkitTransitionEnd" : c.isOpera && (d = "oTransitionEnd");
                   c.Event.addEvent(this.dom, d, a, b)
                   },destroy: function() {
                   this.wrap.removeChild(this.dom)
                   },transition: function(a) {
                   this.transitions = "" == this.transitions ? a : this.transitions + "," + a;
                   c.isWebKit ? this.css("WebkitTransition", this.transitions) : c.isGecko ? this.css("MozTransition", this.transitions) : c.isOpera ? this.css("OTransition", this.transitions) : this.css("transition", this.transitions)
                   },beforeshow: function(a, b, c) {
                   c.follow(a, b, c)
                   },show: function(a, b) {
                   this.beforeshow(a, b, this);
                   this.css("visibility", "visible");
                   this.get("animation") && this.css("opacity", 1)
                   },hidden: function() {
                   this.css("visibility", "hidden")
                   },getDom: function() {
                   return this.dom
                   },css: function(a, b) {
                   if (c.isString(a))
                   if (c.isDefined(b))
                   this.dom.style[a] = b;
                   else
                   return this.dom.style[a]
                   },applyStyle: function() {
                   for (var a = this.get("style").split(";"), b, c = 0; c < a.length; c++)
                   b = a[c].split(":"), 1 < b.length && this.css(b[0], b[1])
                   }});
 c.Component = c.extend(c.Painter, {configure: function(a) {
                        c.Component.superclass.configure.apply(this, arguments);
                        this.type = "component";
                        this.set({fontsize: 12,font: "Verdana",fontweight: "normal",tip: {enable: !1,border: {width: 2}}});
                        this.ICHARTJS_CHART = this.proxy = this.atomic = !1;
                        this.inject(a)
                        },initialize: function() {
                        c.DefineAbstract("isEventValid", this);
                        c.DefineAbstract("doDraw", this);
                        this.doConfig();
                        this.initialization = !0
                        },getDimension: function() {
                        return {x: this.x,y: this.y,width: this.get("width"),height: this.get("height")}
                        },destroy: function() {
                        this.tip && this.tip.destroy()
                        },doConfig: function() {
                        c.Component.superclass.doConfig.call(this);
                        var a = this._();
                        a.x = a.push(a.X, a.get(a.X) + a.get("offsetx"));
                        a.y = a.push(a.Y, a.get(a.Y) + a.get("offsety"));
                        a.push("fontStyle", c.getFont(a.get("fontweight"), a.get("fontsize"), a.get("font")));
                        a.data = a.get("data");
                        a.get("tip.enable") && (a.pushIf("tip.border.color", a.get("f_color")), c.isFunction(a.get("tip.invokeOffset")) || a.push("tip.invokeOffset", a.tipInvoke()))
                        },isMouseOver: function(a) {
                        return this.isEventValid(a, this)
                        },redraw: function(a) {
                        this.root.draw(a, this.root.Combination)
                        },commonDraw: function(a) {
                        a.proxy || a.doDraw.call(a, a)
                        }});
 c.Tip = c.extend(c.Html, {configure: function() {
                  c.Tip.superclass.configure.apply(this, arguments);
                  this.type = "tip";
                  this.set({name: "",value: "",text: "",showType: "follow",invokeOffset: null,fade_duration: 300,move_duration: 100,timing_function: "ease-out",invokeOffsetDynamic: !1,style: "textAlign:left;padding:4px 5px;cursor:pointer;backgroundColor:rgba(239,239,239,.85);fontSize:12px;color:black;",border: {enable: !0,radius: 5},delay: 200});
                  this.registerEvent("parseText")
                  },position: function(a, b, c) {
                  c.style.top = (0 > a ? 0 : a) + "px";
                  c.style.left = (0 > b ? 0 : b) + "px"
                  },follow: function(a, b, d) {
                  d.get("invokeOffsetDynamic") ? b.hit && ((c.isString(b.text) || c.isNumber(b.text)) && d.text(b.name, b.value, b.text, b.i, d), a = d.get("invokeOffset")(d.width(), d.height(), b), d.position(a.top, a.left, d)) : "follow" != d.get("showType") && c.isFunction(d.get("invokeOffset")) ? (a = d.get("invokeOffset")(d.width(), d.height(), b), d.position(a.top, a.left, d)) : d.position(a.y - 1.1 * d.height() - 2, a.x + 2, d)
                  },text: function(a, b, c, e, f) {
                  f.dom.innerHTML = f.fireString(f, "parseText", [f, a, b, c, e], c)
                  },hidden: function() {
                  this.get("animation") ? this.css("opacity", 0) : this.css("visibility", "hidden")
                  },doAction: function(a) {
                  a.T.on("mouseover", function(b, c, e) {
                         a.show(c, e)
                         }).on("mouseout", function(b, c) {
                               a.hidden(c)
                               });
                  if ("follow" == a.get("showType"))
                  a.T.on("mousemove", function(b, c, e) {
                         a.T.variable.event.mouseover && setTimeout(function() {
                                                                    a.T.variable.event.mouseover && a.follow(c, e, a)
                                                                    }, a.get("delay"))
                         })
                  },initialize: function() {
                  c.Tip.superclass.initialize.call(this);
                  var a = this._();
                  a.text(a.get("name"), a.get("value"), a.get("text"), 0, a);
                  a.hidden();
                  if (a.get("animation")) {
                  var b = a.get("move_duration") / 1E3 + "s " + a.get("timing_function") + " 0s";
                  a.transition("opacity " + a.get("fade_duration") / 1E3 + "s " + a.get("timing_function") + " 0s");
                  a.transition("top " + b);
                  a.transition("left " + b);
                  a.onTransitionEnd(function() {
                                    0 == a.css("opacity") && a.css("visibility", "hidden")
                                    }, !1)
                  }
                  }});
 c.CrossHair = c.extend(c.Html, {configure: function() {
                        c.CrossHair.superclass.configure.apply(this, arguments);
                        this.type = "crosshair";
                        this.set({top: 0,left: 0,hcross: !0,vcross: !0,invokeOffset: null,line_width: 1,line_color: "#1A1A1A",delay: 200})
                        },follow: function(a, b, c) {
                        c.get("invokeOffset") ? (a = c.get("invokeOffset")(a, b)) && a.hit ? (c.o_valid = !0, c.position(a.top - c.top, a.left - c.left, c)) : (!a || !c.o_valid) && c.position(c.owidth, c.oheight, c) : c.position(a.y - c.top - 1, a.x - c.left - 1, c)
                        },position: function(a, b, c) {
                        c.horizontal.style.top = a - c.size + "px";
                        c.vertical.style.left = b - c.size + "px"
                        },doCreate: function(a, b, d) {
                        var e = document.createElement("div");
                        e.style.width = c.toPixel(b);
                        e.style.height = c.toPixel(d);
                        e.style.backgroundColor = a.get("line_color");
                        e.style.position = "absolute";
                        a.dom.appendChild(e);
                        return e
                        },doAction: function(a) {
                        a.T.on("mouseover", function(b, c, e) {
                               a.show(c, e)
                               }).on("mouseout", function(b, c, e) {
                                     a.hidden(c, e)
                                     }).on("mousemove", function(b, c, e) {
                                           a.follow(c, e, a)
                                           })
                        },initialize: function() {
                        c.CrossHair.superclass.initialize.call(this);
                        var a = this._(), b = c.toPixel(a.get("line_width"));
                        a.size = a.get("line_width") / 2;
                        a.top = c.fixPixel(a.get(a.O));
                        a.left = c.fixPixel(a.get(a.L));
                        a.owidth = -a.T.root.width;
                        a.oheight = -a.T.root.height;
                        a.o_valid = !1;
                        a.css("width", "0px");
                        a.css("height", "0px");
                        a.css("top", a.top + "px");
                        a.css("left", a.left + "px");
                        a.css("visibility", "hidden");
                        a.horizontal = a.doCreate(a, a.get("hcross") ? c.toPixel(a.get(a.W)) : "0px", b);
                        a.vertical = a.doCreate(a, b, a.get("vcross") ? c.toPixel(a.get(a.H)) : "0px")
                        }});
 c.Legend = c.extend(c.Component, {configure: function() {
                     c.Legend.superclass.configure.apply(this, arguments);
                     this.type = "legend";
                     this.set({data: void 0,width: "auto",column: 1,row: "max",maxwidth: 0,line_height: 16,sign: "square",sign_size: 10,sign_space: 5,legend_space: 5,z_index: 1009,text_with_sign_color: !1,align: "right",valign: "middle"});
                     this.atomic = !0;
                     this.registerEvent("parse")
                     },isEventValid: function(a, b) {
                     var c = {valid: !1};
                     a.x > this.x && a.x < b.x + b.width && a.y > b.y && a.y < b.y + b.height && b.data.each(function(e, f) {
                                                                                                             if (a.x > e.x && a.x < e.x + e.width_ + b.get("signwidth") && a.y > e.y && a.y < e.y + b.get("line_height"))
                                                                                                             return c = {valid: !0,index: f,target: e}, !1
                                                                                                             }, b);
                     return c
                     },drawCell: function(a, b, c, e, f, g) {
                     var i = g.get("sign_size"), j = g.getPlugin("sign");
                     if (!j || !j.call(g, g.T, f, a + i / 2, b, i, e))
                     -1 != f.indexOf("bar") && g.T.box(a, b - i / 12, i, i / 6, 0, e), "round" == f ? g.T.round(a + i / 2, b, i / 2, e) : "round-bar" == f ? g.T.round(a + i / 2, b, i / 4, e) : "square-bar" == f ? g.T.box(a + i / 4, b - i / 4, i / 2, i / 2, 0, e) : "square" == f && g.T.box(a, b - i / 2, i, i, 0, e);
                     g.T.fillText(c, a + g.get("signwidth"), b, 0, g.get("text_with_sign_color") ? e : g.get("color"), "lr", g.get("line_height"))
                     },doDraw: function(a) {
                     a.T.box(a.x, a.y, a.width, a.height, a.get("border"), a.get("f_color"), !1, a.get("shadow"));
                     a.T.textStyle(a.L, "middle", c.getFont(a.get("fontweight"), a.get("fontsize"), a.get("font")));
                     a.data.each(function(b) {
                                 a.drawCell(b.x, b.y, b.text, b.color, b.sign, a)
                                 })
                     },doLayout: function(a, b) {
                     var d = a.get("sign_size"), e = 0, f = 0, g = 0, i = a.get("column"), j = a.get("row"), k = a.data.length;
                     a.T.textFont(a.get("fontStyle"));
                     a.get("line_height") < d && a.push("line_height", d + d / 5);
                     a.push("signwidth", d + a.get("sign_space"));
                     a.data.each(function(b) {
                                 b.width_ = a.T.measureText(b.text)
                                 }, a);
                     for (var o = 0; o < i; o++) {
                     for (var g = 0, l = o; l < k; l += i)
                     g = Math.max(g, a.data[l].width_);
                     a.columnwidth[o] = g;
                     e += g
                     }
                     for (o = 0; o < j; o++) {
                     g = 0;
                     for (l = o * i; l < k; l++)
                     g = Math.max(g, a.data[l].text.split("\n").length);
                     a.columnheight[o] = g;
                     f += g
                     }
                     e = a.push(a.W, e + a.get("hpadding") + a.get("signwidth") * i + (i - 1) * a.get("legend_space"));
                     if (e > a.get("maxwidth"))
                     i = a.get("maxwidth") / e, j = c.lowTo, k = Math.floor, a.push("fontsize", j(6, k(a.get("fontsize") * i))), a.push("sign_size", j(6, k(d * i))), a.push("sign_space", j(4, k(a.get("sign_space") * i))), a.push("legend_space", j(4, k(a.get("legend_space") * i))), a.push("fontStyle", c.getFont(a.get("fontweight"), a.get("fontsize"), a.get("font"))), a.doLayout(a, b);
                     else {
                     var q;
                     a.width = e;
                     a.height = f = a.push(a.H, f * a.get("line_height") + a.get("vpadding"));
                     a.y = a.get("valign") == a.O ? b.get("t_originy") : a.get("valign") == a.B ? b.get("b_originy") - f : b.get("centery") - f / 2;
                     a.x = a.get("align") == a.L ? b.get("l_originx") : a.get("align") == a.C ? b.get("centerx") - e / 2 : b.get("r_originx") - e;
                     a.x = a.push(a.X, a.x + a.get("offsetx"));
                     a.y = a.push(a.Y, a.y + a.get("offsety"));
                     g = a.y + a.get("padding_top");
                     d = a.get("legend_space") + a.get("signwidth");
                     for (o = 0; o < j; o++) {
                     f = a.x + a.get("padding_left");
                     q = a.columnheight[o] / 2 * a.get("line_height");
                     g += q;
                     for (l = 0; l < i && o * i + l < k; l++)
                     e = a.data[o * i + l], e.y = g, e.x = f, f += a.columnwidth[l] + d;
                     g += q
                     }
                     }
                     },doConfig: function() {
                     c.Legend.superclass.doConfig.call(this);
                     var a = this._(), b = a.root, d = c.isNumber(a.get("column")), e = c.isNumber(a.get("row")), f = a.data.length;
                     a.get("align") == a.C && "middle" == a.get("valign") && a.push("valign", a.O);
                     b.get("align") == a.L && "middle" == a.get("valign") && a.push("align", a.R);
                     a.data.each(function(b, d) {
                                 c.merge(b, a.fireEvent(a, "parse", [a, b.name, d]));
                                 b.text = b.text || b.name;
                                 b.sign = b.sign || a.get("sign")
                                 }, a);
                     !d && !e && (d = a.push("column", 1));
                     d && !e && (e = a.push("row", Math.ceil(f / a.get("column"))));
                     !d && e && (d = a.push("column", Math.ceil(f / a.get("row"))));
                     d = a.get("column");
                     e = a.get("row");
                     f > e * d && (e += Math.ceil((f - e * d) / d), e = a.push("row", e));
                     a.columnwidth = Array(d);
                     a.columnheight = Array(e);
                     a.doLayout(a, b)
                     }});
 c.Label = c.extend(c.Component, {configure: function() {
                    c.Label.superclass.configure.apply(this, arguments);
                    this.type = "label";
                    this.set({text: "",line_height: 12,line_thickness: 1,sign: "square",sign_size: 12,padding: "2 5",offsety: 2,sign_space: 5,background_color: "#efefef",text_with_sign_color: !1});
                    this.atomic = !0;
                    this.registerEvent()
                    },isEventValid: function(a, b) {
                    return {valid: c.inRange(b.labelx, b.labelx + b.get(b.W), a.x) && c.inRange(b.labely, b.labely + b.get(b.H), a.y)}
                    },text: function(a) {
                    a && this.push("text", a);
                    this.push(this.W, this.T.measureText(this.get("text")) + this.get("hpadding") + this.get("sign_size") + this.get("sign_space"))
                    },localizer: function(a) {
                    var b = a.get("quadrantd"), c = a.get("line_points"), e = a.get("smooth"), b = 1 <= b && 2 >= b, f = a.get("labelx"), g = a.get("labely");
                    a.labelx = f + (b ? -a.get(a.W) - e : e);
                    a.labely = g - a.get(a.H) / 2;
                    c[2] = {x: f,y: g};
                    c[3] = {x: c[2].x + (b ? -e : e),y: c[2].y}
                    },doLayout: function(a, b, c, e) {
                    e.push("labelx", e.get("labelx") + a / c);
                    e.push("labely", e.get("labely") + b / c);
                    e.get("line_points").each(function(c, d) {
                                              c.x += a;
                                              c.y += b;
                                              return 1 == d
                                              }, e);
                    e.localizer(e)
                    },doDraw: function(a) {
                    var b = a.get("line_points"), c = a.get("sign_size"), e = a.labelx + a.get("padding_left"), f = a.labely + a.get("padding_top");
                    a.T.label(b, a.get("line_thickness"), a.get("border.color"));
                    a.T.box(a.labelx, a.labely, a.get(a.W), a.get(a.H), a.get("border"), a.get("f_color"), !1, a.get("shadow"));
                    a.T.textStyle(a.L, a.O, a.get("fontStyle"));
                    b = a.get("color");
                    a.get("text_with_sign_color") && (b = a.get("scolor"));
                    "square" == a.get("sign") ? a.T.box(e, f, c, c, 0, a.get("scolor")) : a.get("sign") && a.T.round(e + c / 2, f + c / 2, c / 2, a.get("scolor"));
                    a.T.fillText(a.get("text"), e + c + a.get("sign_space"), f, a.get("textwidth"), b)
                    },doConfig: function() {
                    c.Label.superclass.doConfig.call(this);
                    var a = this._();
                    a.T.textFont(a.get("fontStyle"));
                    a.get("fontsize") > a.get("line_height") && a.push("line_height", a.get("fontsize"));
                    a.get("sign") || (a.push("sign_size", 0), a.push("sign_space", 0));
                    a.push(a.H, a.get("line_height") + a.get("vpadding"));
                    a.text();
                    a.localizer(a)
                    }});
 c.Text = c.extend(c.Component, {configure: function() {
                   c.Text.superclass.configure.apply(this, arguments);
                   this.type = "text";
                   this.set({text: "",textAlign: "center",background_color: 0,textBaseline: "top",border: {enable: !1},width: 0,height: 0,padding: 0,writingmode: "lr",line_height: 16,rotate: 0});
                   this.registerEvent()
                   },doDraw: function(a) {
                   a.get("box_feature") && a.T.box(a.x, a.y, a.get(a.W), a.get(a.H), a.get("border"), a.get("f_color"));
                   a.T.text(a.get("text"), a.get("textx"), a.get("texty"), a.get(a.W), a.get("color"), a.get("textAlign"), a.get("textBaseline"), a.get("fontStyle"), a.get("writingmode"), a.get("line_height"), a.get("shadow"), a.get("rotate"))
                   },isEventValid: function() {
                   return {valid: !1}
                   },doLayout: function(a, b, c, e) {
                   e.x = e.push(e.X, e.x + a);
                   e.y = e.push(e.Y, e.y + b);
                   e.push("textx", e.get("textx") + a);
                   e.push("texty", e.get("texty") + b)
                   },doConfig: function() {
                   c.Text.superclass.doConfig.call(this);
                   var a = this._(), b = a.x, d = a.y + a.get("padding_top"), e = a.get(a.W), f = a.get(a.H), g = a.get("textAlign"), b = b + (g == a.C ? e / 2 : g == a.R ? e - a.get("padding_right") : a.get("padding_left"));
                   f && (d += f / 2, a.push("textBaseline", "middle"));
                   a.push("textx", b);
                   a.push("texty", d);
                   a.push("box_feature", e && f);
                   a.applyGradient()
                   }});
 (function(a) {
  function b(h) {
  "string" === typeof h && (h = a(h));
  if (!h || !h.tagName || "canvas" != h.tagName.toLowerCase())
  throw Error("there not a canvas element");
//  h.style.width = h.width + "px";
//  h.style.height = h.height +"px";
//  h.width = h.width * window.devicePixelRatio;
//  h.height = h.height * window.devicePixelRatio;
  this.canvas = h;
  this.c = this.canvas.getContext("2d");
//  this.c.scale(window.devicePixelRatio, window.devicePixelRatio);
  }
  var c = Math.PI, e = c / 90, f = e / 2, g = Math.ceil, i = Math.floor, j = 2 * c, k = Math.max, o = Math.min, l = Math.sin, q = Math.cos, m = function(a, b) {
  return 1 == a ? i(b) + 0.5 : Math.round(b)
  }, r = function(a, b, c, d) {
  var e = b.x, f = b.y, g = a[c - 1], j = a[c + 1], i, n;
  if (c < a.length - 1) {
  var a = g.y, c = j.y, m;
  i = (d * e + g.x) / (d + 1);
  n = (d * f + a) / (d + 1);
  j = (d * e + j.x) / (d + 1);
  d = (d * f + c) / (d + 1);
  m = (d - n) * (j - e) / (j - i) + f - d;
  n += m;
  d += m;
  n > a && n > f ? (n = k(a, f), d = 2 * f - n) : n < a && n < f && (n = o(a, f), d = 2 * f - n);
  d > c && d > f ? (d = k(c, f), n = 2 * f - d) : d < c && d < f && (d = o(c, f), n = 2 * f - d);
  b.rcx = j;
  b.rcy = d
  }
  return [g.rcx || g.x, g.rcy || g.y, i || e, n || f, e, f]
  }, t = function(h) {
  return a.isNumber(h) ? h : a.parseFloat(h, h)
  }, u = function(h, b) {
  var c, d = 0, e, f = 0, g = !1, j = b.get("labels");
  b.data = h;
  if ("simple" == b.dataType)
  b.total = 0, h.each(function(h) {
                      h.background_color = h.color;
                      d = h.value;
                      if (a.isArray(d)) {
                      var j = 0;
                      f = d.length > f ? d.length : f;
                      for (var i = 0; i < d.length; i++)
                      d[i] = t(d[i]), j += d[i], g || (c = e = d[i], g = !0), c = k(d[i], c), e = o(d[i], e);
                      h.total = j
                      } else
                      d = t(d), h.value = d, b.total += d, g || (c = e = d, g = !0), c = k(d, c), e = o(d, e)
                      }, b), a.isArray(j) && (f = j.length > f ? j.length : f), b.push("maxItemSize", f);
  else if ("stacked" == b.dataType || "complex" == b.dataType) {
  var i = j.length, n, m, l, r = "stacked" == b.dataType;
  if (0 == i)
  for (var i = h[0].value.length, q = 0; q < i; q++)
  j.push("");
  b.columns = [];
  for (q = 0; q < i; q++)
  n = [], m = 0, h.each(function(a, b) {
                        if (d = a.value[q])
                        a.value[q] = d = t(d, d), m += d, r ? l = h[b].color : (l = a.color, g || (c = e = d, g = !0), c = k(d, c), e = o(d, e)), n.push({name: a.name,value: a.value[q],background_color: l,color: l})
                        }), r && (g || (c = e = d, g = !0), c = k(m, c), e = o(m, e)), b.columns.push({total: m,name: j[q],item: n})
  }
  b.push("minValue", e);
  b.push("maxValue", c);
  b.doConfig();
  b.initialization = !0
  };
  b.prototype = {getContext: function() {
  return this.c
  },css: function(h, b) {
  if (a.isDefined(b))
  this.canvas.style[h] = b;
  else
  return this.canvas.style[h]
  },ellipse: function(a, b, c, d, f, g, j, i, k, n, m, o, t, r) {
  t = !!t;
  this.save().gCo(r).strokeStyle(i, k, n).shadowOn(m).fillStyle(j).moveTo(a, b).beginPath();
  for (t && this.moveTo(a, b); f <= g; )
  this.lineTo(a + c * q(f), b + d * l(f)), f += e;
  return this.lineTo(a + c * q(g), b + d * l(g)).closePath().stroke(i).fill(j).restore()
  },arc: function(a, b, c, d, e, f, g, j, k, n, m, o, t, r) {
  if (!c)
  return this;
  this.save().gCo(r).strokeStyle(j, k, n).fillStyle(g).beginPath();
  j && (c -= i(k / 2));
  d ? (this.moveTo(a + q(e) * (c - d), b + l(e) * (c - d)).lineTo(a + q(e) * c, b + l(e) * c), this.c.arc(a, b, c, e, f, o), this.lineTo(a + q(f) * (c - d), b + l(f) * (c - d)), this.c.arc(a, b, c - d, f, e, !o)) : (this.c.arc(a, b, c, e, f, o), t && this.lineTo(a, b));
  this.closePath();
  j ? this.shadowOn(m).stroke(j).shadowOff().fill(g) : this.shadowOn(m).fill(g);
  return this.restore()
  },sector: function(a, b, c, d, e, f, g, j, i, n, k, m, l, o) {
  k && this.arc(a, b, c, d, e, f, g, j, i, n, k, m, !l, !o);
  return this.arc(a, b, c, d, e, f, g, j, i, n, !1, m, !l)
  },sector3D: function() {
  var h = function(h, b, c, d, s, f, g, j, i) {
  var g = function(a, e) {
  this.lineTo(h + c * q(a), b + (e || 0) + d * l(a))
  }, v = s;
  for (this.fillStyle(a.dark(i)).moveTo(h + c * q(s), b + d * l(s)).beginPath(); v <= f; )
  g.call(this, v), v += e;
  g.call(this, f);
  this.lineTo(h + c * q(f), b + j + d * l(f));
  for (v = f; v >= s; )
  g.call(this, v, j), v -= e;
  g.call(this, s, j);
  this.lineTo(h + c * q(s), b + d * l(s)).closePath().fill(!0)
  }, b = function(a, h, b, c, d, e, s, f) {
  b = a + b * q(s);
  c = h + e + c * l(s);
  this.moveTo(a, h).beginPath().fillStyle(f).lineTo(a, h + e).lineTo(b, c).lineTo(b, c - e).lineTo(a, h).closePath().fill(!0)
  }, c = function(h, c, d, e, f, g, j, i, v) {
  var w = a.quadrantd(f), k = a.quadrantd(g), v = a.dark(v);
  (1 == w || 2 == w) && b.call(this, h, c, d, e, j, i, f, v);
  (0 == k || 3 == k) && b.call(this, h, c, d, e, j, i, g, v)
  }, d = function(a, b, d, e, s, f, g, j, i, w, k, m, l) {
  this.ellipse(a, b + g, d, e, s, f, j, i, w, k, m, l, !0);
  c.call(this, a, b, d, e, s, f, l, g, j);
  this.ellipse(a, b, d, e, s, f, j, i, w, k, !1, l, !0);
  h.call(this, a, b, d, e, s, f, l, g, j);
  return this
  };
  d.layerPaint = c;
  d.sPaint = h;
  d.layerDraw = b;
  return d
  }(),textStyle: function(a, b, c) {
  return this.textAlign(a).textBaseline(b).textFont(c)
  },strokeStyle: function(a, b, c, d) {
  if (a && (b && (this.c.lineWidth = b), c && (this.c.strokeStyle = c), d))
  this.c.lineJoin = d;
  return this
  },globalAlpha: function(a) {
  a && (this.c.globalAlpha = a);
  return this
  },fillStyle: function(a) {
  a && (this.c.fillStyle = a);
  return this
  },arc2: function(a, b, c, d, e, f) {
  c && this.c.arc(a, b, c, d, e, f);
  return this
  },textAlign: function(a) {
  a && (this.c.textAlign = a);
  return this
  },textBaseline: function(a) {
  a && (this.c.textBaseline = a);
  return this
  },textFont: function(a) {
  a && (this.c.font = a);
  return this
  },shadowOn: function(a) {
  a && (this.c.shadowColor = a.color, this.c.shadowBlur = a.blur, this.c.shadowOffsetX = a.offsetx, this.c.shadowOffsetY = a.offsety);
  return this
  },shadowOff: function() {
  this.c.shadowColor = "white";
  this.c.shadowBlur = this.c.shadowOffsetX = this.c.shadowOffsetY = 0;
  return this
  },gradient: function(a, b, c, d, e, f, g) {
  var f = f.toLowerCase(), j = a, i = b, n = !f.indexOf("linear"), f = f.substring(14);
  if (n) {
  switch (f) {
  case "updown":
  i += d;
  break;
  case "downup":
  b += d;
  break;
  case "leftright":
  j += c;
  break;
  case "rightleft":
  a += c;
  break;
  default:
  return e[0]
  }
  return this.avgLinearGradient(a, b, j, i, e)
  }
  a += c / 2;
  b += d / 2;
  return this.avgRadialGradient(a, b, g || 0, a, b, c > d ? d : c, "outin" == f ? e.reverse() : e)
  },avgLinearGradient: function(a, b, c, d, e) {
  a = this.createLinearGradient(a, b, c, d);
  for (b = 0; b < e.length; b++)
  a.addColorStop(b / (e.length - 1), e[b]);
  return a
  },createLinearGradient: function(a, b, c, d) {
  return this.c.createLinearGradient(a, b, c, d)
  },avgRadialGradient: function(a, b, c, d, e, f, g) {
  a = this.createRadialGradient(a, b, c, d, e, f);
  for (b = 0; b < g.length; b++)
  a.addColorStop(b / (g.length - 1), g[b]);
  return a
  },createRadialGradient: function(a, b, c, d, e, f) {
  return this.c.createRadialGradient(a, b, c, d, e, f)
  },text: function(a, b, c, d, e, f, g, j, i, n, k, m) {
  return this.save().textStyle(f, g, j).fillText(a, b, c, d, e, i, n, k, m).restore()
  },fillText: function(a, b, c, d, e, g, j, i, k) {
  a = a.toString();
  if (!a || !a.length)
  return this;
  d = d || !1;
  j = j || 16;
  a = a.split("tb" == (g || "lr") ? "" : "\n");
  1 < a.length && ("middle" == this.c.textBaseline ? c -= (a.length - 1) * j / 2 : "bottom" == this.c.textBaseline && (c -= (a.length - 1) * j));
  this.save().fillStyle(e).translate(b, c).rotate(f * k).shadowOn(i);
  a.each(function(a, h) {
         try {
         d ? this.c.fillText(a, 0, h * j, d) : this.c.fillText(a, 0, h * j)
         } catch (e) {
         console.log(e.message + "[" + a + "," + b + "," + c + "]")
         }
         }, this);
  return this.restore()
  },measureText: function(a) {
  var a = a.split("\n"), b = 0;
  a.each(function(a) {
         b = k(this.measureText(a).width, b)
         }, this.c);
  return b
  },moveTo: function(a, b) {
  this.c.moveTo(a || 0, b || 0);
  return this
  },lineTo: function(a, b) {
  this.c.lineTo(a || 0, b || 0);
  return this
  },save: function() {
  this.c.save();
  return this
  },restore: function() {
  this.c.restore();
  return this
  },beginPath: function() {
  this.c.beginPath();
  return this
  },closePath: function() {
  this.c.closePath();
  return this
  },stroke: function(a) {
  a && this.c.stroke();
  return this
  },fill: function(a) {
  a && this.c.fill();
  return this
  },cube: function(b, c, d, e, f, g, j, i, k, n, l, o) {
  b = m(n, b);
  c = m(n, c);
  j = j && 0 < j ? j : f;
  e = c - j * e;
  d = m(n, b + j * d);
  e = m(n, e);
  o && (this.polygon(i, k, n, l, o, !1, [{x: b,y: c}, {x: d,y: e}, {x: d + f,y: e}, {x: b + f,y: c}]), this.polygon(i, k, n, l, o, !1, [{x: b,y: c}, {x: b,y: c + g}, {x: b + f,y: c + g}, {x: b + f,y: c}]), this.polygon(i, k, n, l, o, !1, [{x: b + f,y: c}, {x: d + f,y: e}, {x: d + f,y: e + g}, {x: b + f,y: c + g}]));
  this.polygon(a.dark(i), k, n, l, !1, !1, [{x: b,y: c}, {x: d,y: e}, {x: d + f,y: e}, {x: b + f,y: c}]);
  this.polygon(i, k, n, l, !1, !1, [{x: b,y: c}, {x: b,y: c + g}, {x: b + f,y: c + g}, {x: b + f,y: c}]);
  this.polygon(a.dark(i), k, n, l, !1, !1, [{x: b + f,y: c}, {x: d + f,y: e}, {x: d + f,y: e + g}, {x: b + f,y: c + g}]);
  return this
  },cube3D: function(b, c, d, e, f, g, j, i, k, n, l, o) {
  b = m(n, b);
  c = m(n, c);
  i = !i || 0 == i ? g : i;
  f ? (e = a.vectorP2P(d, e), d = b + i * e.x, e = c - i * e.y) : (d = b + i * d, e = c - i * e);
  for (; 6 > o.length; )
  o.push(!1);
  d = m(n, d);
  e = m(n, e);
  i = [];
  0 > e ? a.isObject(o[4]) && i.push(a.applyIf({points: [{x: b,y: c - j}, {x: d,y: e - j}, {x: d + g,y: e - j}, {x: b + g,y: c - j}]}, o[4])) : a.isObject(o[0]) && i.push(a.applyIf({points: [{x: b,y: c}, {x: d,y: e}, {x: d + g,y: e}, {x: b + g,y: c}]}, o[0]));
  a.isObject(o[1]) && i.push(a.applyIf({points: [{x: d,y: e}, {x: d,y: e - j}, {x: d + g,y: e - j}, {x: d + g,y: e}]}, o[1]));
  a.isObject(o[2]) && i.push(a.applyIf({points: [{x: b,y: c}, {x: b,y: c - j}, {x: d,y: e - j}, {x: d,y: e}]}, o[2]));
  a.isObject(o[3]) && i.push(a.applyIf({points: [{x: b + g,y: c}, {x: b + g,y: c - j}, {x: d + g,y: e - j}, {x: d + g,y: e}]}, o[3]));
  0 > e ? a.isObject(o[0]) && i.push(a.applyIf({points: [{x: b,y: c}, {x: d,y: e}, {x: d + g,y: e}, {x: b + g,y: c}]}, o[0])) : a.isObject(o[4]) && i.push(a.applyIf({points: [{x: b,y: c - j}, {x: d,y: e - j}, {x: d + g,y: e - j}, {x: b + g,y: c - j}]}, o[4]));
  a.isObject(o[5]) && i.push(a.applyIf({points: [{x: b,y: c}, {x: b,y: c - j}, {x: b + g,y: c - j}, {x: b + g,y: c}]}, o[5]));
  i.each(function(a) {
         this.polygon(a.color, k, n, l, a.shadow, a.alpha, a.points)
         }, this);
  return this
  },polygon: function(a, b, c, d, e, f, g, j, i, k) {
  this.save().strokeStyle(b, c, d).beginPath().fillStyle(a).globalAlpha(f).shadowOn(e).moveTo(g[0].x, g[0].y);
  if (j) {
  this.moveTo(m(c, k[0].x), m(c, k[0].y)).lineTo(m(c, g[0].x), m(c, g[0].y));
  for (d = 1; d < g.length; d++)
  this.bezierCurveTo(r(g, g[d], d, i));
  this.lineTo(m(c, k[1].x), m(c, k[1].y))
  } else
  for (d = 1; d < g.length; d++)
  this.lineTo(m(c, g[d].x), m(c, g[d].y));
  return this.closePath().stroke(b).fill(a).restore()
  },lines: function(a, b, c, d) {
  this.save().gCo(d).beginPath().strokeStyle(!0, b, c).moveTo(m(b, a[0]), m(b, a[1]));
  for (c = 2; c < a.length - 1; c += 2)
  this.lineTo(m(b, a[c]), m(b, a[c + 1]));
  return this.stroke(!0).restore()
  },bezierCurveTo: function(a) {
  this.c.bezierCurveTo(a[0], a[1], a[2], a[3], a[4], a[5]);
  return this
  },label: function(a, b, c) {
  return this.save().beginPath().strokeStyle(!0, b, c).moveTo(m(b, a[0].x), m(b, a[0].y)).bezierCurveTo([a[1].x, a[1].y, a[2].x, a[2].y, a[3].x, a[3].y]).stroke(!0).restore()
  },lineArray: function(a, b, c, d, e) {
  this.save().beginPath().strokeStyle(!0, b, c).moveTo(m(b, a[0].x), m(b, a[0].y));
  for (c = 1; c < a.length; c++)
  d ? this.bezierCurveTo(r(a, a[c], c, e || 1.5)) : this.lineTo(m(b, a[c].x), m(b, a[c].y));
  return this.stroke(!0).restore()
  },dotted: function(b, c, d, e, f, g, j, k, l) {
  if (!f)
  return this;
  var b = m(f, b), c = m(f, c), d = m(f, d), e = m(f, e), n = a.distanceP2P(b, c, d, e), o;
  if (0 >= j || n <= j || b != d && c != e)
  return this.line(b, c, d, e, f, g, l);
  if (b > d || c > e)
  o = b, b = d, d = o, o = c, c = e, e = o;
  this.save().gCo(l).strokeStyle(!0, f, g).beginPath().moveTo(b, c);
  f = j * (k || 1);
  g = i(n / (j + f));
  n = n - g * (j + f) > j;
  k = c == e;
  g = n ? g + 1 : g;
  for (l = 1; l <= g; l++)
  this.lineTo(k ? b + j * l + f * (l - 1) : b, k ? c : c + j * l + f * (l - 1)).moveTo(k ? b + (j + f) * l : b, k ? c : c + (j + f) * l);
  n || this.lineTo(d, e);
  return this.stroke(!0).restore()
  },line: function(a, b, c, d, e, f, g) {
  if (!e)
  return this;
  this.save().gCo(g);
  return this.beginPath().strokeStyle(!0, e, f).moveTo(m(e, a), m(e, b)).lineTo(m(e, c), m(e, d)).stroke(!0).restore()
  },round: function(a, b, c, d, e, f) {
  return this.arc(a, b, c, 0, 0, j, d, !!f, e, f)
  },round0: function(a, b, c, d, e) {
  return this.arc(a.x, a.y, b, 0, 0, j, c, !!e, d, e)
  },fillRect: function(a, b, c, d) {
  this.c.fillRect(a, b, c, d);
  return this
  },translate: function(a, b) {
  this.c.translate(a, b);
  return this
  },rotate: function(a) {
  this.c.rotate(a);
  return this
  },clearRect: function(a, b, c, d) {
  c = c || this.width;
  d = d || this.height;
  this.c.clearRect(a || 0, b || 0, c, d);
  return this
  },gCo: function(a) {
  return a ? this.gCO(a) : this
  },gCO: function(a) {
  this.c.globalCompositeOperation = a ? "destination-over" : "source-over";
  return this
  },box: function(b, e, f, k, l, o, p, t, q) {
  l = l || {enable: 0};
  if (l.enable) {
  var n = l.width, r = l.color, u = l.radius, y = a.isNumber(n), n = a.parsePadding(n);
  n[0] == n[1] && n[1] == n[2] && n[2] == n[3] && (y = !0);
  t = t ? 1 : -1;
  f += t * (n[1] + n[3]) / 2;
  k += t * (n[0] + n[2]) / 2;
  b -= t * (n[3] / 2);
  e -= t * (n[0] / 2);
  n = y ? n[0] : n;
  u = !y || !u || 0 == u || "0" == u ? 0 : a.parsePadding(u)
  }
  this.save().gCo(q).fillStyle(o).strokeStyle(y, n, r);
  u ? this.beginPath().moveTo(m(n, b + u[0]), m(n, e)).lineTo(m(n, b + f - u[1]), m(n, e)).arc2(m(n, b + f - u[1]), m(n, e + u[1]), u[1], 3 * c / 2, j).lineTo(m(n, b + f), m(n, e + k - u[2])).arc2(m(n, b + f - u[2]), m(n, e + k - u[2]), u[2], 0, c / 2).lineTo(m(n, b + u[3]), m(n, e + k)).arc2(m(n, b + u[3]), m(n, e + k - u[3]), u[3], c / 2, c).lineTo(m(n, b), m(n, e + u[0])).arc2(m(n, b + u[0]), m(n, e + u[0]), u[0], c, 3 * c / 2).closePath().shadowOn(p).stroke(n).shadowOff().fill(o) : !l.enable || y ? (n && l.enable && (this.shadowOn(p).c.strokeRect(b, e, f, k), this.shadowOff()), o && this.fillRect(b, e, f, k)) : (n && (r = a.isArray(r) ? r : [r, r, r, r], this.shadowOn(p).line(b + f, e + n[0] / 2, b + f, e + k - n[0] / 2, n[1], r[1], 0).line(b, e + n[0] / 2, b, e + k - n[0] / 2, n[3], r[3], 0).line(i(b - n[3] / 2), e, b + f + n[1] / 2, e, n[0], r[0], 0).line(i(b - n[3] / 2), e + k, b + f + n[1] / 2, e + k, n[2], r[2], 0).shadowOff()), o && this.beginPath().moveTo(i(b + n[3] / 2), i(e + n[0] / 2)).lineTo(g(b + f - n[1] / 2), e + n[0] / 2).lineTo(g(b + f - n[1] / 2), g(e + k - n[2] / 2)).lineTo(i(b + n[3] / 2), g(e + k - n[2] / 2)).lineTo(i(b + n[3] / 2), i(e + n[0] / 2)).closePath().fill(o));
  return this.restore()
  },toDataURL: function(a) {
  return this.canvas.toDataURL(a || "image/png")
  },addEvent: function(b, c, d) {
  a.Event.addEvent(this.canvas, b, c, d)
  }};
  a.taylor = {light: function(a, b) {
  b.highlight = !1;
  a.on("mouseover", function() {
       b.highlight = !0;
       a.redraw("mouseover")
       }).on("mouseout", function() {
             b.highlight = !1;
             a.redraw("mouseout")
             }).on("beforedraw", function() {
                   a.push("f_color", b.highlight ? a.get("light_color") : a.get("f_color_"));
                   return !0
                   })
  }};
  a.Chart = a.extend(a.Painter, {configure: function() {
                     a.Chart.superclass.configure.apply(this, arguments);
                     this.type = "chart";
                     this.dataType = "simple";
                     this.set({id: "",render: "",data: [],width: void 0,height: void 0,lineJoin: "round",align: "center",default_mouseover_css: !0,turn_off_touchmove: !1,showpercent: !1,decimalsnum: 1,title: {text: "",fontweight: "bold",fontsize: 20,height: 30},subtitle: {text: "",fontweight: "bold",fontsize: 16,height: 20},footnote: {text: "",color: "#5d7f97",textAlign: "right",height: 20},title_align: "center",title_valign: "top",animation: !1,doAnimation: null,animation_timing_function: "easeInOut",animation_duration: 1E3,z_index: 999,legend: {enable: !1},tip: {enable: !1}});
                     this.registerEvent("beforeAnimation", "afterAnimation", "animating");
                     this.T = null;
                     this.Animationed = this.Combination = this.Rendered = !1;
                     this.data = [];
                     this.plugins = [];
                     this.components = [];
                     this.total = 0;
                     this.ICHARTJS_CHART = !0
                     },toDataURL: function(a) {
                     return this.T.toDataURL(a)
                     },segmentRect: function() {
                     this.Combination || this.T.clearRect(this.get("l_originx"), this.get("t_originy"), this.get("client_width"), this.get("client_height"))
                     },resetCanvas: function() {
                     this.Combination || this.T.box(this.get("l_originx"), this.get("t_originy"), this.get("client_width"), this.get("client_height"), 0, this.get("f_color"), 0, 0, !0)
                     },animation: function(b) {
                     b.segmentRect();
                     b.coo && !b.ILLUSIVE_COO && b.coo.draw();
                     b.doAnimation(b.variable.animation.time, b.duration, b);
                     b.legend && b.legend.draw();
                     b.plugins.each(function(a) {
                                    a.A_draw && (a.variable.animation.animating = !0, a.variable.animation.time = b.variable.animation.time, a.draw(), a.variable.animation.animating = !1)
                                    });
                     b.Combination || (b.resetCanvas(), b.variable.animation.time < b.duration ? (b.variable.animation.time++, a.requestAnimFrame(function() {
                                                                                                                                                  b.animation(b)
                                                                                                                                                  })) : a.requestAnimFrame(function() {
                                                                                                                                                                           b.Animationed = !0;
                                                                                                                                                                           b.plugins.each(function(a) {
                                                                                                                                                                                          a.Animationed = !0
                                                                                                                                                                                          });
                                                                                                                                                                           b.processAnimation = !1;
                                                                                                                                                                           b.draw();
                                                                                                                                                                           b.plugins.each(function(a) {
                                                                                                                                                                                          a.processAnimation = !1
                                                                                                                                                                                          });
                                                                                                                                                                           b.fireEvent(b, "afterAnimation", [b])
                                                                                                                                                                           }))
                     },runAnimation: function(a) {
                     a.fireEvent(a, "beforeAnimation", [a]);
                     a.A_draw || (a.variable.animation = {type: 0,time: 0,queue: []});
                     a.processAnimation = !0;
                     a.animation(a)
                     },doSort: function() {
                     this.components.sor(function(b, c) {
                                         return (a.isArray(b) ? b.zIndex || 0 : b.get("z_index")) > (a.isArray(c) ? c.zIndex || 0 : c.get("z_index"))
                                         })
                     },commonDraw: function(b, c) {
                     b.redraw || (a.Assert.isTrue(b.Rendered, b.type + " has not rendered"), a.Assert.isTrue(b.data && 0 < b.data.length, b.type + "'s data is empty"), a.Assert.isTrue(b.initialization, b.type + " Failed to initialize"), b.doSort(), b.oneways.eachAll(function(a) {
                                                                                                                                                                                                                                                                           a.draw()
                                                                                                                                                                                                                                                                           }));
                     b.redraw = !0;
                     !b.Animationed && b.get("animation") ? b.runAnimation(b) : (b.segmentRect(), b.components.eachAll(function(a) {
                                                                                                                       a.draw(c)
                                                                                                                       }), b.resetCanvas())
                     },plugin: function(a) {
                     var b = this._();
                     a.inject(b);
                     a.ICHARTJS_CHART && (a.Combination = !0, a.setUp());
                     b.get("animation") || a.push("animation", !1);
                     a.duration = b.duration;
                     b.components.push(a);
                     b.plugins.push(a)
                     },destroy: function() {
                     this.components.eachAll(function(a) {
                                             a.destroy()
                                             })
                     },getTitle: function() {
                     return this.title
                     },getSubTitle: function() {
                     return this.subtitle
                     },getFootNote: function() {
                     return this.footnote
                     },getDrawingArea: function() {
                     return {x: this.get("l_originx"),x: this.get("t_originy"),width: this.get("client_width"),height: this.get("client_height")}
                     },setUp: function() {
                     var a = this._();
                     a.redraw = !1;
                     a.T.clearRect();
                     a.initialization = !1;
                     a.initialize()
                     },create: function(c, d) {
                     if (c.get("fit")) {
                     var e = window.innerWidth, f = window.innerHeight, g = a.getDoc().body.style;
                     g.padding = "0px";
                     g.margin = "0px";
                     g.overflow = "hidden";
                     c.push(c.W, e);
                     c.push(c.H, f)
                     }
                     c.canvasid = a.uid(c.type);
                     c.shellid = "shell-" + c.canvasid;
                     e = [];
                     e.push("<div id='");
                     e.push(c.shellid);
                     e.push("' style='padding:0px;margin:0px;overflow:hidden;position:relative;'>");
                     e.push("<canvas id= '");
                     e.push(c.canvasid);
                     e.push("'><p>Your browser does not support the canvas element</p></canvas></div>");
                     d.innerHTML = e.join("");
                     c.shell = a(c.shellid);
                     c.T = c.target = new b(c.canvasid);
                     c.size(c);
                     c.Rendered = !0
                     },size: function(a) {
                     a.T.canvas.width = a.width = a.pushIf(a.W, 400);
                     a.T.canvas.height = a.height = a.pushIf(a.H, 300);
                     a.shell.style.width = a.width + "px";
                     a.shell.style.height = a.height + "px"
                     },initialize: function() {
                     var b = this._(), c = b.get("data"), d = b.get("render");
                     b.Combination ? (a.apply(b.options, a.clone([b.W, b.H, "padding", "border", "client_height", "client_width", "minDistance", "maxDistance", "minstr", "centerx", "centery", "l_originx", "r_originx", "t_originy", "b_originy"], b.root.options, !0)), b.width = b.get(b.W), b.height = b.get(b.H), b.shell = b.root.shell, b.Rendered = !0) : b.Rendered ? (b.width != b.get(b.W) || b.height != b.get(b.H)) && b.size(b) : d && b.create(b, a(d));
                     b.Rendered && !b.initialization && (c && 0 < c.length ? u.call(b, c, b) : a.isString(b.get("url")) && b.ajax.call(b, b.get("url"), function(a) {
                                                                                                                                       b.push("data", a);
                                                                                                                                       b.initialize();
                                                                                                                                       b.draw()
                                                                                                                                       }))
                     },eventOff: function() {
                     this.stopEvent = !0
                     },eventOn: function() {
                     this.stopEvent = !1
                     },oneWay: function(b) {
                     var c = b.variable.event, d = b.Combination, e = !b.get("turn_off_touchmove") && !d, f = !a.touch && b.get("default_mouseover_css") && !d, g, j = a.touch ? ["touchstart", "touchmove"] : ["click", "mousemove"];
                     b.stopEvent = !1;
                     b.A_draw = d && b.processAnimation;
                     a.register(b);
                     d || j.each(function(c) {
                                 b.T.addEvent(c, function(d) {
                                              b.processAnimation || b.stopEvent || d.targetTouches && 1 != d.targetTouches.length || b.fireEvent(b, c, [b, a.Event.fix(d)])
                                              }, !1)
                                 });
                     b.on(j[0], function(a, b) {
                          a.components.eachAll(function(a) {
                                               if (a.ICHARTJS_CHART) {
                                               if (a.fireEvent(a, j[0], [a, b]))
                                               return c.click = !0, !1
                                               } else {
                                               var d = a.isMouseOver(b);
                                               if (d.valid)
                                               return c.click = !0, a.fireEvent(a, "click", [a, b, d]), !b.stopPropagation
                                               }
                                               });
                          if (c.click)
                          return e && b.event.preventDefault(), c.click = !1, !0
                          });
                     if (!a.touch || e)
                     if (b.on(j[1], function(a, b) {
                              g = !1;
                              a.components.eachAll(function(a) {
                                                   if (a.ICHARTJS_CHART) {
                                                   if (a.fireEvent(a, j[1], [a, b]))
                                                   return g = !0, !1
                                                   } else {
                                                   var c = a.variable.event, d = a.isMouseOver(b);
                                                   if (d.valid) {
                                                   if (g = g || a.atomic, c.mouseover || (c.mouseover = !0, a.fireEvent(a, "mouseover", [a, b, d])), a.fireEvent(a, "mousemove", [a, b, d]), d.stop)
                                                   return !1
                                                   } else
                                                   c.mouseover && (c.mouseover = !1, a.fireEvent(a, "mouseout", [a, b, d]));
                                                   return !b.stopPropagation
                                                   }
                                                   });
                              if (c.mouseover)
                              return b.event.preventDefault(), !g && c.mouseover && (c.mouseover = !1, a.fireEvent(a, "mouseout", [a, b])), c.mouseover;
                              g && (c.mouseover = g, a.fireEvent(a, "mouseover", [a, b]))
                              }), f)
                     b.on("mouseover", function() {
                          b.T.css("cursor", "pointer")
                          }).on("mouseout", function() {
                                b.T.css("cursor", "default")
                                });
                     b.oneWay = a.emptyFn
                     },originXY: function(a, b, c) {
                     var d = a.get("align");
                     d == a.L ? a.pushIf(a.X, b[0]) : d == a.R ? a.pushIf(a.X, b[1]) : a.pushIf(a.X, b[2]);
                     a.x = a.push(a.X, a.get(a.X) + a.get("offsetx"));
                     a.y = a.push(a.Y, a.get(a.Y) || c[0] + a.get("offsety"));
                     return {x: a.x,y: a.y}
                     },getPercent: function(a, b) {
                     return this.get("showpercent") ? (100 * (a / (b || this.total || 1))).toFixed(this.get("decimalsnum")) + "%" : a
                     },doActing: function(b, c, d, e, f) {
                     var e = !!b.get("communal_acting"), g = b.getPercent(c.value, c.total);
                     b.push(e ? "sub_option" : "communal_acting", a.clone(b.get(e ? "communal_acting" : "sub_option"), !0));
                     a.merge(b.get("sub_option"), c);
                     a.merge(b.get("sub_option"), d);
                     b.push("sub_option.value", g);
                     b.get("sub_option.tip.enable") && (b.push("sub_option.tip.text", f || c.name + " " + g), b.push("sub_option.tip.name", c.name), b.push("sub_option.tip.value", c.value), b.push("sub_option.tip.total", c.total || b.total))
                     },doConfig: function() {
                     a.Chart.superclass.doConfig.call(this);
                     var b = this._();
                     b.T.strokeStyle(!0, 0, b.get("strokeStyle"), b.get("lineJoin"));
                     b.processAnimation = b.get("animation");
                     b.push("communal_acting", 0);
                     a.isFunction(b.get("doAnimation")) && (b.doAnimation = b.get("doAnimation"));
                     b.animationArithmetic = a.getAA(b.get("animation_timing_function"));
                     b.destroy();
                     b.components = [];
                     b.plugins.each(function(a) {
                                    b.components.push(a)
                                    });
                     b.oneWay(b);
                     a.applyIf(b.get("sub_option"), a.clone(["shadow", "tip"], b.options, !0));
                     b.push("r_originx", b.width - b.get("padding_right"));
                     b.push("b_originy", b.height - b.get("padding_bottom"));
                     b.oneways = [];
                     if (!b.Combination) {
                     var c = 0, d = b.push("l_originx", b.get("padding_left")), e = b.push("t_originy", b.get("padding_top")), f = b.push("client_width", b.width - b.get("hpadding"));
                     b.duration = g(b.get("animation_duration") * a.FRAME / 1E3);
                     b.oneways.push(new a.Custom({drawFn: function() {
                                                 b.T.box(0, 0, b.width, b.height, b.get("border"), b.get("f_color"), 0, 0, true)
                                                 }}));
                     b.applyGradient();
                     a.isString(b.get("title")) && b.push("title", a.applyIf({text: b.get("title")}, b.default_.title));
                     a.isString(b.get("subtitle")) && b.push("subtitle", a.applyIf({text: b.get("subtitle")}, b.default_.subtitle));
                     a.isString(b.get("footnote")) && b.push("footnote", a.applyIf({text: b.get("footnote")}, b.default_.footnote));
                     if ("" != b.get("title.text")) {
                     var j = "" != b.get("subtitle.text"), c = j ? b.get("title.height") + b.get("subtitle.height") : b.get("title.height"), e = b.push("t_originy", e + c);
                     b.push("title.originx", d);
                     b.push("title.originy", b.get("padding_top"));
                     b.push("title.width", f);
                     b.title = new a.Text(b.get("title"), b);
                     b.oneways.push(b.title);
                     j && (b.push("subtitle.originx", d), b.push("subtitle.originy", b.get("title.originy") + b.get("title.height")), b.push("subtitle.width", f), b.subtitle = new a.Text(b.get("subtitle"), b), b.oneways.push(b.subtitle))
                     }
                     "" != b.get("footnote.text") && (j = b.get("footnote.height"), c += j, b.push("b_originy", b.get("b_originy") - j), b.push("footnote.originx", d), b.push("footnote.originy", b.get("b_originy")), b.push("footnote.width", f), b.footnote = new a.Text(b.get("footnote"), b), b.oneways.push(b.footnote));
                     c = b.push("client_height", b.get(b.H) - b.get("vpadding") - c);
                     b.push("minDistance", o(f, c));
                     b.push("maxDistance", k(f, c));
                     b.push("minstr", f < c ? b.W : b.H);
                     b.push("centerx", d + f / 2);
                     b.push("centery", e + c / 2)
                     }
                     b.get("legend.enable") && (b.legend = new a.Legend(a.apply({maxwidth: b.get("client_width"),data: b.data}, b.get("legend")), b), b.components.push(b.legend));
                     b.push("sub_option.tip.wrap", b.push("tip.wrap", b.shell))
                     }})
  })(c);
 c.Custom = c.extend(c.Component, {configure: function() {
                     c.Custom.superclass.configure.apply(this, arguments);
                     this.type = "custom";
                     this.set({drawFn: c.emptyFn,configFn: c.emptyFn,eventValid: void 0,animating_draw: !0})
                     },doDraw: function(a) {
                     a.get("drawFn").call(a, a)
                     },isEventValid: function(a, b) {
                     return c.isFunction(this.get("eventValid")) ? this.get("eventValid").call(this, a, b) : {valid: !1}
                     },doConfig: function() {
                     c.Custom.superclass.doConfig.call(this);
                     var a = this._();
                     a.A_draw = a.get("animating_draw");
                     a.variable.animation = {animating: !1,time: 0};
                     a.duration = 0;
                     a.get("configFn").call(a, a)
                     }});
 c.Scale = c.extend(c.Component, {configure: function() {
                    c.Scale.superclass.configure.apply(this, arguments);
                    this.type = "scale";
                    this.set({position: "left",which: "h",basic_value: 0,scale2grid: !0,distance: void 0,start_scale: 0,end_scale: void 0,min_scale: void 0,max_scale: void 0,scale_space: void 0,scale_share: 5,scale_enable: !0,scale_size: 1,scale_width: 4,scale_color: "#333333",scaleAlign: "center",labels: [],label: {},text_space: 6,textAlign: "left",decimalsnum: 0,join_style: "none",join_size: 2});
                    this.registerEvent("parseText")
                    },isEventValid: function() {
                    return {valid: !1}
                    },getScale: function(a) {
                    a = [a.get("basic_value"), a.get("start_scale"), a.get("end_scale"), a.get("end_scale") - a.get("start_scale"), 0];
                    a[4] = c.inRange(a[1], a[2] + 1, a[0]) || c.inRange(a[2] - 1, a[1], a[0]);
                    return {range: a[4],basic: a[4] ? (a[0] - a[1]) / a[3] : 0,start: a[4] ? a[0] : a[1],end: a[2],distance: a[3]}
                    },doDraw: function(a) {
                    a.get("scale_enable") && a.items.each(function(b) {
                                                          a.T.line(b.x0, b.y0, b.x1, b.y1, a.get("scale_size"), a.get("scale_color"), !1)
                                                          });
                    a.labels.each(function(a) {
                                  a.draw()
                                  })
                    },doLayout: function(a, b, c) {
                    c.get("scale_enable") && c.items.each(function(c) {
                                                          c.x0 += a;
                                                          c.y0 += b;
                                                          c.x1 += a;
                                                          c.y1 += b
                                                          });
                    c.labels.each(function(c) {
                                  c.doLayout(a, b, 0, c)
                                  })
                    },doConfig: function() {
                    c.Scale.superclass.doConfig.call(this);
                    var a = this._(), b = Math.abs, d = a.get("labels").length, e = a.get("min_scale"), f = a.get("max_scale"), g = a.get("scale_space"), i = a.get("end_scale"), j = a.get("start_scale");
                    a.items = [];
                    a.labels = [];
                    a.number = 0;
                    if (0 < d)
                    a.number = d - 1;
                    else {
                    j > e && (j = a.push("start_scale", c.floor(e)));
                    if (!c.isNumber(i) || i < f)
                    i = c.ceil(f), i = a.push("end_scale", !i && !j ? 1 : i);
                    g && b(g) < b(i - j) && a.push("scale_share", (i - j) / g);
                    a.number = a.push("scale_share", b(a.get("scale_share")));
                    if (!g || g > i - j) {
                    g = (i - j + "").indexOf(".") + 1;
                    for (b = 1; 0 < g; )
                    g--, b *= 10;
                    g = a.push("scale", (i - j) * b / a.get("scale_share") / b)
                    }
                    parseInt(g) != g && 0 == a.get("decimalsnum") && a.push("decimalsnum", (g + "").substring((g + "").indexOf(".") + 1).length)
                    }
                    a.push("distanceOne", a.get("valid_distance") / a.number);
                    var k, o, l, q = f = e = b = i = 0, m = 0;
                    k = a.get("scale_width");
                    o = k / 2;
                    l = a.get("scaleAlign");
                    var r = a.get("position"), t = a.get("text_space"), u = "", h = a.get("coo").get("axis.width");
                    a.push("which", a.get("which").toLowerCase());
                    a.isH = "h" == a.get("which");
                    a.isH ? (l == a.O ? f = -k : l == a.C ? (f = -o, b = o) : b = k, r == a.O ? (m = -t - h[0], u = a.B) : (m = t + h[2], u = a.O), r = a.C) : (l == a.L ? e = -k : l == a.C ? (e = -o, i = o) : i = k, u = "middle", r == a.R) ? (r = a.L, q = t + h[1]) : (r = a.R, q = -t - h[3]);
                    for (t = 0; t <= a.number; t++)
                    k = d ? a.get("labels")[t] : (g * t + j).toFixed(a.get("decimalsnum")), o = a.isH ? a.get("valid_x") + t * a.get("distanceOne") : a.x, l = a.isH ? a.y : a.get("valid_y") + a.get("distance") - t * a.get("distanceOne"), a.items.push({x: o,y: l,x0: o + e,y0: l + f,x1: o + i,y1: l + b}), a.get("label") && a.labels.push(new c.Text(c.applyIf(c.apply(a.get("label"), c.merge({text: k,x: o,y: l,originx: o + q,originy: l + m}, a.fireEvent(a, "parseText", [k, o + q, l + m, t, a.number == t]))), {textAlign: r,textBaseline: u}), a))
                    }});
 c.Coordinate = {coordinate_: function(a) {
 var b = this._(), d = b.get("coordinate");
 if (d.ICHARTJS_OBJECT)
 return b.ILLUSIVE_COO = !0, d;
 var d = c.parsePercent, e = b.get("coordinate.scale"), f = b.get("scaleAlign"), g = b.push("coordinate.width", d(b.get("coordinate.width"), Math.floor(0.84 * b.get("client_width")))), i = b.push("coordinate.height", d(b.get("coordinate.height"), Math.floor(0.84 * b.get("client_height"))) - (b.is3D() ? (b.get("coordinate.pedestal_height") || 22) + (b.get("coordinate.board_deep") || 20) : 0));
 b.push("coordinate.valid_width", d(b.get("coordinate.valid_width"), g));
 b.push("coordinate.valid_height", d(b.get("coordinate.valid_height"), i));
 b.originXY(b, [b.get("l_originx"), b.get("r_originx") - g, b.get("centerx") - g / 2], [b.get("centery") - i / 2]);
 b.push("coordinate.originx", b.x);
 b.push("coordinate.originy", b.y);
 a && a();
 c.isObject(e) && (e = [e]);
 c.isArray(e) ? e.each(function(a) {
                       b.get("percent") && a.position == f && (a = c.apply(a, {start_scale: 0,end_scale: 100,scale_space: 10,listeners: {parseText: function(a) {
                                                                           return {text: a + "%"}
                                                                           }}}));
                       a.start_scale || (a.min_scale = b.get("minValue"));
                       a.end_scale || (a.max_scale = b.get("maxValue"))
                       }) : b.push("coordinate.scale", {position: f,scaleAlign: f,max_scale: b.get("maxValue"),min_scale: b.get("minValue")});
 b.is3D() && (b.push("coordinate.xAngle_", b.get("xAngle_")), b.push("coordinate.yAngle_", b.get("yAngle_")), b.push("coordinate.zHeight", b.get("zHeight") * b.get("bottom_scale")));
 d = new (c[b.is3D() ? "Coordinate3D" : "Coordinate2D"])(b.get("coordinate"), b);
 b.components.push(d);
 return d
 }};
 c.Coordinate2D = c.extend(c.Component, {configure: function() {
                           c.Coordinate2D.superclass.configure.apply(this, arguments);
                           this.type = "coordinate2d";
                           this.set({sign_size: 12,sign_space: 5,scale: [],width: "80%",height: "80%",valid_width: "100%",valid_height: "100%",grid_line_width: 1,grid_color: "#dbe1e1",gridHStyle: {},gridVStyle: {},gridlinesVisible: !0,scale2grid: !0,grids: void 0,ignoreOverlap: !0,ignoreEdge: !1,xlabel: "",ylabel: "",background_color: 0,striped: !0,striped_direction: "v",striped_factor: 0.01,crosshair: {enable: !1},width: void 0,height: void 0,z_index: -1,axis: {enable: !0,color: "#666666",width: 1}});
                           this.scale = [];
                           this.gridlines = []
                           },getScale: function(a, b) {
                           for (var c = this._(), e = 0; e < c.scale.length; e++)
                           if (c.scale[e].get("position") == a)
                           return c.scale[e].getScale(c.scale[e]);
                           if (!b)
                           return a = a == c.L ? c.R : a == c.R ? c.L : a == c.O ? c.B : c.O, c.getScale(a, !0);
                           throw Error("there no valid scale");
                           },isEventValid: function(a, b) {
                           return {valid: a.x > b.x && a.x < b.x + b.get(b.W) && a.y < b.y + b.get(b.H) && a.y > b.y}
                           },doDraw: function(a) {
                           a.T.box(a.x, a.y, a.get(a.W), a.get(a.H), 0, a.get("f_color"));
                           if (a.get("striped")) {
                           var b, d, e = !1;
                           a.get("axis.width");
                           var f = c.dark(a.get("background_color"), a.get("striped_factor"), 0)
                           }
                           var g = "v" == a.get("striped_direction");
                           a.gridlines.each(function(c) {
                                            a.get("striped") && (e && (g ? a.T.box(c.x1, c.y1 + c.width, c.x2 - c.x1, d - c.y1 - c.width, 0, f) : a.T.box(b + c.width, c.y2, c.x1 - b, c.y1 - c.y2, 0, f)), b = c.x1, d = c.y1, e = !e)
                                            }).each(function(b) {
                                                    b.overlap || (b.solid ? a.T.line(b.x1, b.y1, b.x2, b.y2, b.width, b.color) : a.T.dotted(b.x1, b.y1, b.x2, b.y2, b.width, b.color, b.size, b.fator))
                                                    });
                           a.T.box(a.x, a.y, a.get(a.W), a.get(a.H), a.get("axis"), !1, a.get("shadow"), !0);
                           a.scale.each(function(a) {
                                        a.draw()
                                        })
                           },destroy: function() {
                           this.crosshair && this.crosshair.destroy()
                           },doCrosshair: function(a) {
                           a.get("crosshair.enable") && !a.crosshair && (a.push("crosshair.wrap", a.root.shell), a.push("crosshair.height", a.get(a.H)), a.push("crosshair.width", a.get(a.W)), a.push("crosshair.top", a.y), a.push("crosshair.left", a.x), a.crosshair = new c.CrossHair(a.get("crosshair"), a))
                           },doConfig: function() {
                           c.Coordinate2D.superclass.doConfig.call(this);
                           var a = this._();
                           a.atomic = !1;
                           a.get("gradient") && c.isString(a.get("f_color")) && a.push("f_color", a.T.avgLinearGradient(a.x, a.y, a.x, a.y + a.get(a.H), [a.get("dark_color"), a.get("light_color")]));
                           if (a.get("axis.enable")) {
                           var b = a.get("axis.width");
                           c.isArray(b) || a.push("axis.width", [b, b, b, b])
                           } else
                           a.push("axis.width", [0, 0, 0, 0]);
                           a.doCrosshair(a);
                           var d, e = (b = !(!a.get("gridlinesVisible") || !a.get("grids"))) && !!a.get("grids.horizontal"), f = b && !!a.get("grids.vertical"), g = a.get(a.H), i = a.get(a.W), j = a.get("valid_width"), k = a.get("valid_height"), b = a.get("gridlinesVisible") && a.get("scale2grid") && !(e && f), o = (i - j) / 2, l = (g - k) / 2, q = a.get("axis.width");
                           a.push("x_start", a.x + (i - j) / 2);
                           a.push("x_end", a.x + (i + j) / 2);
                           a.push("y_start", a.y + (g - k) / 2);
                           a.push("y_end", a.y + (g + k) / 2);
                           c.isArray(a.get("scale")) || (c.isObject(a.get("scale")) ? a.push("scale", [a.get("scale")]) : a.push("scale", []));
                           a.get("scale").each(function(b) {
                                               d = (d = b.position) || a.L;
                                               d = d.toLowerCase();
                                               b[a.X] = a.x;
                                               b.coo = a;
                                               b[a.Y] = a.y;
                                               b.valid_x = a.x + o;
                                               b.valid_y = a.y + l;
                                               b.position = d;
                                               d == a.O ? (b.which = "h", b.distance = i, b.valid_distance = j) : d == a.R ? (b.which = "v", b.distance = g, b.valid_distance = k, b[a.X] += i, b.valid_x += j) : d == a.B ? (b.which = "h", b.distance = i, b.valid_distance = j, b[a.Y] += g, b.valid_y += k) : (b.which = "v", b.distance = g, b.valid_distance = k);
                                               a.scale.push(new c.Scale(b, a.root))
                                               }, a);
                           var m = a.push("ignoreOverlap", a.get("ignoreOverlap") && a.get("axis.enable") || a.get("ignoreEdge"));
                           if (m)
                           var r = a.get("ignoreEdge") ? function(b, c, d) {
                           return "v" == b ? d == a.y || d == a.y + g : c == a.x || c == a.x + b
                           } : function(b, c, d) {
                           return "v" == b ? d == a.y && 0 < q[0] || d == a.y + g && 0 < q[2] : c == a.x && 0 < q[3] || c == a.x + i && 0 < q[1]
                           };
                           var t = {solid: !0,size: 10,fator: 1,width: a.get("grid_line_width"),color: a.get("grid_color")}, u = c.applyIf(a.get("gridHStyle"), t), h = c.applyIf(a.get("gridVStyle"), t);
                           if (b) {
                           var s, v, w;
                           a.scale.each(function(b) {
                                        w = b.get("position");
                                        if (!c.isFalse(b.get("scale2grid")) && !(e && "v" == b.get("which") || f && "h" == b.get("which")))
                                        s = v = 0, w == a.O ? v = g : w == a.R ? s = -i : w == a.B ? v = -g : s = i, b.items.each(function(d) {
                                                                                                                                  m && a.gridlines.push(c.applyIf({overlap: r.call(a, b.get("which"), d.x, d.y),x1: d.x,y1: d.y,x2: d.x + s,y2: d.y + v}, b.isH ? h : u))
                                                                                                                                  })
                                        })
                           }
                           if (f) {
                           var x = a.get("grids.vertical");
                           c.Assert.isTrue(0 < x.value, "vertical value");
                           b = i / x.value;
                           t = x.value;
                           "given_value" == x.way && (t = b, b = x.value, b = b > i ? i : b);
                           for (x = 0; x <= t; x++)
                           m && a.gridlines.push(c.applyIf({overlap: r.call(a, "h", a.x + x * b, a.y),x1: a.x + x * b,y1: a.y,x2: a.x + x * b,y2: a.y + g,H: !1,width: h.width,color: h.color}, h))
                           }
                           if (e) {
                           x = a.get("grids.horizontal");
                           c.Assert.isTrue(0 < x.value, "horizontal value");
                           b = g / x.value;
                           t = x.value;
                           "given_value" == x.way && (t = b, b = x.value, b = b > g ? g : b);
                           for (x = 0; x <= t; x++)
                           m && a.gridlines.push(c.applyIf({overlap: r.call(a, "v", a.x, a.y + x * b),x1: a.x,y1: a.y + x * b,x2: a.x + i,y2: a.y + x * b,H: !0,width: u.width,color: u.color}, u))
                           }
                           }});
 c.Coordinate3D = c.extend(c.Coordinate2D, {configure: function() {
                           c.Coordinate3D.superclass.configure.apply(this, arguments);
                           this.type = "coordinate3d";
                           this.dimension = c._3D;
                           this.set({xAngle: 60,yAngle: 20,xAngle_: void 0,yAngle_: void 0,zHeight: 0,pedestal_height: 22,board_deep: 20,left_board: !0,gradient: !0,color_factor: 0.18,ignoreEdge: !0,striped: !1,grid_color: "#a4ad96",background_color: "#d6dbd2",shadow_offsetx: 4,shadow_offsety: 2,wall_style: [],axis: {enable: !1}})
                           },doDraw: function(a) {
                           var b = a.get(a.W), c = a.get(a.H), e = a.get("xAngle_"), f = a.get("yAngle_"), g = a.get("zHeight"), i = a.get("z_offx"), j = a.get("z_offy");
                           a.get("pedestal_height") && a.T.cube3D(a.x, a.y + c + a.get("pedestal_height"), e, f, !1, b, a.get("pedestal_height"), 3 * g / 2, a.get("axis.enable"), a.get("axis.width"), a.get("axis.color"), a.get("bottom_style"));
                           a.get("board_deep") && a.T.cube3D(a.x + i, a.y + c - j, e, f, !1, b, c, a.get("board_deep"), a.get("axis.enable"), a.get("axis.width"), a.get("axis.color"), a.get("board_style"));
                           a.T.cube3D(a.x, a.y + c, e, f, !1, b, c, g, a.get("axis.enable"), a.get("axis.width"), a.get("axis.color"), a.get("wall_style"));
                           a.gridlines.each(function(b) {
                                            b.solid ? (a.get("left_board") && a.T.line(b.x1, b.y1, b.x1 + i, b.y1 - j, b.width, b.color), a.T.line(b.x1 + i, b.y1 - j, b.x2 + i, b.y2 - j, b.width, b.color)) : (a.get("left_board") && a.T.dotted(b.x1, b.y1, b.x1 + i, b.y1 - j, b.width, b.color, b.size, b.fator), a.T.dotted(b.x1 + i, b.y1 - j, b.x2 + i, b.y2 - j, b.width, b.color, b.size, b.fator))
                                            });
                           a.scale.each(function(a) {
                                        a.draw()
                                        })
                           },doConfig: function() {
                           c.Coordinate3D.superclass.doConfig.call(this);
                           for (var a = this._(), b = a.get("wall_style"), d = a.get("background_color") || "#d6dbd2", e = a.get(a.H), f = a.get(a.W), g = a.get("color_factor"), i = a.push("z_offx", a.get("xAngle_") * a.get("zHeight")), j = a.push("z_offy", a.get("yAngle_") * a.get("zHeight")); 6 > b.length; )
                           b.push({color: d});
                           a.get("left_board") || (b[2] = !1, a.scale.each(function(a) {
                                                                           a.doLayout(i, -j, a)
                                                                           }));
                           a.push("bottom_style", [{color: a.get("shadow_color"),shadow: a.get("shadow")}, !1, !1, {color: b[3].color}, !1, {color: b[3].color}]);
                           a.push("board_style", [!1, !1, !1, {color: b[4].color}, {color: b[5].color}, !1]);
                           a.get("gradient") && (c.isString(b[0].color) && (b[0].color = a.T.avgLinearGradient(a.x, a.y + e, a.x + f, a.y + e, [c.dark(b[0].color, g / 2 + 0.06), c.dark(b[0].color, g / 2 + 0.06)])), c.isString(b[1].color) && (b[1].color = a.T.avgLinearGradient(a.x + i, a.y - j, a.x + i, a.y + e - j, [c.dark(b[1].color, g), c.light(b[1].color, g)])), c.isString(b[2].color) && (b[2].color = a.T.avgLinearGradient(a.x, a.y, a.x, a.y + e, [c.light(b[2].color, g / 3), c.dark(b[2].color, g)])), a.get("bottom_style")[5].color = a.T.avgLinearGradient(a.x, a.y + e, a.x, a.y + e + a.get("pedestal_height"), [c.light(b[3].color, g / 2 + 0.06), c.dark(b[3].color, g / 2, 0)]));
                           a.push("wall_style", [b[0], b[1], b[2]])
                           }});
 c.Rectangle = c.extend(c.Component, {configure: function() {
                        c.Rectangle.superclass.configure.apply(this, arguments);
                        this.type = "rectangle";
                        this.set({width: 0,height: 0,value_space: 4,value: "",label: {},name: "",tipAlign: "top",valueAlign: "top",shadow_blur: 3,shadow_offsety: -1});
                        this.atomic = !0;
                        this.registerEvent("parseText");
                        this.label = null
                        },doDraw: function(a) {
                        a.drawRectangle();
                        a.label && a.label.draw()
                        },doConfig: function() {
                        c.Rectangle.superclass.doConfig.call(this);
                        var a = this._(), b = a.variable.event, d = a.get("valueAlign");
                        c.taylor.light(a, b);
                        a.width = a.get(a.W);
                        a.height = a.get(a.H);
                        var b = a.push("centerx", a.x + a.width / 2), e = a.push("centery", a.y + a.height / 2), f = a.C, g = "middle", i = a.get("value_space");
                        a.push("value", a.fireString(a, "parseText", [a, a.get("value")], a.get("value")));
                        d == a.L ? (f = a.R, b = a.x - i) : d == a.R ? (f = a.L, b = a.x + a.width + i) : d == a.B ? (e = a.y + a.height + i, g = a.O) : d == a.O && (e = a.y - i, g = a.B);
                        a.get("label") && (a.push("label.originx", b), a.push("label.originy", e), a.push("label.text", a.get("value")), c.applyIf(a.get("label"), {textAlign: f,textBaseline: g,color: a.get("color")}), a.label = new c.Text(a.get("label"), a));
                        a.get("tip.enable") && ("follow" != a.get("tip.showType") && a.push("tip.invokeOffsetDynamic", !1), a.tip = new c.Tip(a.get("tip"), a))
                        }});
 c.Rectangle2D = c.extend(c.Rectangle, {configure: function() {
                          c.Rectangle2D.superclass.configure.apply(this, arguments);
                          this.type = "rectangle2d";
                          this.set({shadow_offsety: -2})
                          },drawRectangle: function() {
                          var a = this._();
                          a.T.box(a.get(a.X), a.get(a.Y), a.get(a.W), a.get(a.H), a.get("border"), a.get("f_color"), a.get("shadow"))
                          },isEventValid: function(a, b) {
                          return {valid: a.x > b.x && a.x < b.x + b.width && a.y < b.y + b.height && a.y > b.y}
                          },tipInvoke: function() {
                          var a = this._();
                          return function(b, c) {
                          return {left: a.tipX(b, c),top: a.tipY(b, c)}
                          }
                          },doConfig: function() {
                          c.Rectangle2D.superclass.doConfig.call(this);
                          var a = this._(), b = a.get("tipAlign");
                          b == a.L || b == a.R ? a.tipY = function(b, c) {
                          return a.get("centery") - c / 2
                          } : a.tipX = function(b) {
                          return a.get("centerx") - b / 2
                          };
                          b == a.L ? a.tipX = function(b) {
                          return a.x - a.get("value_space") - b
                          } : b == a.R ? a.tipX = function() {
                          return a.x + a.width + a.get("value_space")
                          } : a.tipY = b == a.B ? function() {
                          return a.y + a.height + 3
                          } : function(b, c) {
                          return a.y - c - 3
                          };
                          a.applyGradient()
                          }});
 c.Rectangle3D = c.extend(c.Rectangle, {configure: function() {
                          c.Rectangle3D.superclass.configure.apply(this, arguments);
                          this.type = "rectangle3d";
                          this.dimension = c._3D;
                          this.set({zHeight: void 0,xAngle: 60,yAngle: 20,xAngle_: void 0,yAngle_: void 0,shadow_offsetx: 2})
                          },drawRectangle: function() {
                          var a = this._();
                          a.T.cube(a.get(a.X), a.get(a.Y), a.get("xAngle_"), a.get("yAngle_"), a.get(a.W), a.get(a.H), a.get("zHeight"), a.get("f_color"), a.get("border.enable"), a.get("border.width"), a.get("light_color"), a.get("shadow"))
                          },isEventValid: function(a, b) {
                          return {valid: a.x > b.x && a.x < b.x + b.get(b.W) && a.y < b.y + b.get(b.H) && a.y > b.y}
                          },tipInvoke: function() {
                          var a = this._();
                          return function(b, c) {
                          return {left: a.topCenterX - b / 2,top: a.topCenterY - c}
                          }
                          },doConfig: function() {
                          c.Rectangle3D.superclass.doConfig.call(this);
                          var a = this._();
                          a.pushIf("zHeight", a.get(a.W));
                          a.topCenterX = a.x + (a.get(a.W) + a.get(a.W) * a.get("xAngle_")) / 2;
                          a.topCenterY = a.y - a.get(a.W) * a.get("yAngle_") / 2;
                          a.get("valueAlign") == a.O && a.label && (a.label.push("textx", a.topCenterX), a.label.push("texty", a.topCenterY))
                          }});
 c.Sector = c.extend(c.Component, {configure: function() {
                     c.Sector.superclass.configure.apply(this, arguments);
                     this.type = "sector";
                     this.set({value: "",name: "",ignored: !1,counterclockwise: !1,startAngle: 0,middleAngle: 0,endAngle: 0,totalAngle: 0,bound_event: "click",expand: !1,donutwidth: 0,mutex: !1,increment: void 0,gradient_mode: "RadialGradientOutIn",mini_label_threshold_angle: 15,mini_label: !1,label: {},rounded: !1});
                     this.atomic = !0;
                     this.registerEvent("changed", "parseText");
                     this.tip = this.label = null
                     },bound: function() {
                     this.expanded || this.toggle()
                     },rebound: function() {
                     this.expanded && this.toggle()
                     },toggle: function() {
                     this.fireEvent(this, this.get("bound_event"), [this])
                     },getDimension: function() {
                     var a = this._();
                     return {x: a.x,x: a.y,startAngle: a.get("startAngle"),middleAngle: a.get("middleAngle"),endAngle: a.get("endAngle")}
                     },doDraw: function(a) {
                     a.get("ignored") || (a.label && !a.get("mini_label") && a.label.draw(), a.drawSector(), a.label && a.get("mini_label") && a.label.draw())
                     },doText: function(a, b, d) {
                     a.push("label.originx", b);
                     a.push("label.originy", d);
                     a.push("label.textBaseline", "middle");
                     a.label = new c.Text(a.get("label"), a)
                     },doLabel: function(a, b, d, e, f, g, i, j) {
                     a.push("label.originx", b);
                     a.push("label.originy", d);
                     a.push("label.quadrantd", e);
                     a.push("label.line_points", f);
                     a.push("label.labelx", g);
                     a.push("label.labely", i);
                     a.push("label.smooth", j);
                     a.push("label.angle", a.get("middleAngle") % (2 * Math.PI));
                     a.label = new c.Label(a.get("label"), a)
                     },isLabel: function() {
                     return this.get("label") && !this.get("mini_label")
                     },doConfig: function() {
                     c.Sector.superclass.doConfig.call(this);
                     var a = this._(), b = a.variable.event, d = a.get("label"), e = a.get("bound_event"), f;
                     a.get("rounded") ? (a.push("startAngle", 0), a.push("endAngle", 2 * Math.PI)) : (c.taylor.light(a, b), a.push("totalAngle", a.get("endAngle") - a.get("startAngle")), d && (a.get("mini_label") && (a.get("mini_label_threshold_angle") * Math.PI / 180 > a.get("totalAngle") ? a.push("mini_label", !1) : c.apply(a.get("label"), a.get("mini_label"))), a.push("label.text", a.fireString(a, "parseText", [a, a.get("label.text")], a.get("label.text"))), a.pushIf("label.border.color", a.get("border.color")), a.push("label.scolor", a.get("background_color"))), a.variable.event.status = a.expanded = a.get("expand"), a.get("tip.enable") && ("follow" != a.get("tip.showType") && a.push("tip.invokeOffsetDynamic", !1), a.tip = new c.Tip(a.get("tip"), a)), b.poped = !1, a.on(e, function() {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 b.poped = true;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 a.expanded = !a.expanded;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 a.redraw(e);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 b.poped = false
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 }), a.on("beforedraw", function(c, i) {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          if (i == e) {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          f = false;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          a.x = a.get(a.X);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          a.y = a.get(a.Y);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          if (a.expanded)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          if (a.get("mutex") && !b.poped) {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          a.expanded = false;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          f = true
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          } else {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          a.x = a.x + a.get("inc_x");
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          a.y = a.y - a.get("inc_y")
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          if (b.status != a.expanded) {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          a.fireEvent(a, "changed", [a, a.expanded]);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          f = true;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          b.status = a.expanded
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          d && f && a.label.doLayout(a.get("inc_x") * (a.expanded ? 1 : -1), -a.get("inc_y") * (a.expanded ? 1 : -1), 2, a.label)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          return true
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          }))
                     }});
 c.Sector2D = c.extend(c.Sector, {configure: function() {
                       c.Sector2D.superclass.configure.apply(this, arguments);
                       this.type = "sector2d";
                       this.set({radius: 0})
                       },drawSector: function() {
                       this.T.sector(this.x, this.y, this.r, this.get("donutwidth"), this.get("startAngle"), this.get("endAngle"), this.get("f_color"), this.get("border.enable"), this.get("border.width"), this.get("border.color"), this.get("shadow"), this.get("counterclockwise"))
                       },isEventValid: function(a, b) {
                       if (!b.get("ignored")) {
                       if (b.isLabel() && b.label.isEventValid(a, b.label).valid)
                       return {valid: !0};
                       var d = c.distanceP2P(b.x, b.y, a.x, a.y), e = b.get("donutwidth");
                       if (b.r < d || e && b.r - e > d)
                       return {valid: !1};
                       if (c.angleInRange(b.get("startAngle"), b.get("endAngle"), c.atan2Radian(b.x, b.y, a.x, a.y)))
                       return {valid: !0}
                       }
                       return {valid: !1}
                       },tipInvoke: function() {
                       var a = this, b = a.get("middleAngle"), d = c.quadrantd(b);
                       return function(e, f) {
                       var g = c.p2Point(a.x, a.y, b, 0.8 * a.r);
                       return {left: 1 <= d && 2 >= d ? g.x - e : g.x,top: 2 <= d ? g.y - f : g.y}
                       }
                       },doConfig: function() {
                       c.Sector2D.superclass.doConfig.call(this);
                       var a = this._();
                       a.r = a.get("radius");
                       a.get("donutwidth") > a.r && a.push("donutwidth", 0);
                       a.applyGradient(a.x - a.r, a.y - a.r, 1.8 * a.r, 1.8 * a.r);
                       var b = a.get("middleAngle"), d = a.pushIf("increment", c.lowTo(5, a.r / 10));
                       a.push("inc_x", d * Math.cos(2 * Math.PI - b));
                       a.push("inc_y", d * Math.sin(2 * Math.PI - b));
                       d *= 2;
                       if (a.get("label"))
                       if (a.get("mini_label"))
                       P2 = c.p2Point(a.x, a.y, b, a.get("donutwidth") ? a.r - a.get("donutwidth") / 2 : a.r / 2), a.doText(a, P2.x, P2.y);
                       else {
                       var e = c.quadrantd(b), f = c.p2Point(a.x, a.y, b, a.r + d), g = c.p2Point(a.x, a.y, b, a.r + 0.6 * d);
                       P2 = c.p2Point(a.x, a.y, b, a.r);
                       a.doLabel(a, P2.x, P2.y, e, [{x: P2.x,y: P2.y}, {x: g.x,y: g.y}, {x: f.x,y: f.y}], f.x, f.y, 0.4 * d)
                       }
                       }});
 c.Sector3D = c.extend(c.Sector, {configure: function() {
                       c.Sector3D.superclass.configure.apply(this, arguments);
                       this.type = "sector3d";
                       this.dimension = c._3D;
                       this.set({semi_major_axis: 0,semi_minor_axis: 0,cylinder_height: 0});
                       this.proxy = !0
                       },isEventValid: function(a, b) {
                       if (!b.get("ignored")) {
                       if (b.isLabel() && b.label.isEventValid(a, b.label).valid)
                       return {valid: !0};
                       if (!c.inEllipse(a.x - b.x, a.y - b.y, b.a, b.b))
                       return {valid: !1};
                       if (c.angleZInRange(b.sA, b.eA, c.atan2Radian(b.x, b.y, a.x, a.y)))
                       return {valid: !0}
                       }
                       return {valid: !1}
                       },p2p: function(a, b, c, e) {
                       return {x: a + this.a * Math.cos(c) * e,y: b + this.b * Math.sin(c) * e}
                       },tipInvoke: function() {
                       var a = this, b = a.get("middleAngle"), d = c.quadrantd(b);
                       return function(c, f) {
                       var g = a.p2p(a.x, a.y, b, 0.6);
                       return {left: 2 <= d && 3 >= d ? g.x - c : g.x,top: 3 <= d ? g.y - f : g.y}
                       }
                       },doConfig: function() {
                       c.Sector3D.superclass.doConfig.call(this);
                       var a = this._(), b = a.get("counterclockwise"), d = a.get("middleAngle");
                       a.a = a.get("semi_major_axis");
                       a.b = a.get("semi_minor_axis");
                       a.h = a.get("cylinder_height");
                       c.Assert.isTrue(0 <= a.a * a.b, "major&minor");
                       var e = 2 * Math.PI, f = function(d) {
                       for (; 0 > d; )
                       d += e;
                       return Math.abs(c.atan2Radian(0, 0, a.a * Math.cos(d), b ? -a.b * Math.sin(d) : a.b * Math.sin(d)))
                       }, g = a.pushIf("increment", c.lowTo(5, a.a / 10));
                       a.sA = f.call(a, a.get("startAngle"));
                       a.eA = f.call(a, a.get("endAngle"));
                       a.mA = f.call(a, d);
                       a.push("inc_x", g * Math.cos(e - a.mA));
                       a.push("inc_y", g * Math.sin(e - a.mA));
                       g *= 2;
                       if (a.get("label"))
                       if (a.get("mini_label"))
                       g = a.p2p(a.x, a.y, d, 0.5), a.doText(a, g.x, g.y);
                       else {
                       var f = c.quadrantd(d), i = a.p2p(a.x, a.y, d, g / a.a + 1), j = a.p2p(a.x, a.y, d, 0.6 * g / a.a + 1), d = a.p2p(a.x, a.y, d, 1);
                       a.doLabel(a, d.x, d.y, f, [{x: d.x,y: d.y}, {x: j.x,y: j.y}, {x: i.x,y: i.y}], i.x, i.y, 0.4 * g)
                       }
                       }});
 c.Pie = c.extend(c.Chart, {configure: function() {
                  c.Pie.superclass.configure.call(this);
                  this.type = "pie";
                  this.set({radius: "100%",offset_angle: 0,separate_angle: 0,bound_event: "click",counterclockwise: !1,intellectLayout: !0,layout_distance: 4,pop_animate: !1,mutex: !1,increment: void 0,sub_option: {label: {}}});
                  this.registerEvent("bound", "rebound");
                  this.ILLUSIVE_COO = !0
                  },toggle: function(a) {
                  this.sectors[a || 0].toggle()
                  },bound: function(a) {
                  this.sectors[a || 0].bound()
                  },rebound: function(a) {
                  this.sectors[a || 0].rebound()
                  },getSectors: function() {
                  return this.sectors
                  },doAnimation: function(a, b, c) {
                  var e = 0, f = c.oA;
                  c.sectors.each(function(g) {
                                 e = c.animationArithmetic(a, 0, g.get("totalAngle"), b);
                                 g.push("startAngle", f);
                                 g.push("endAngle", f + e);
                                 f += e;
                                 c.is3D() || g.drawSector()
                                 });
                  c.is3D() && c.proxy.drawSector()
                  },parse: function(a) {
                  a.data.each(function(b, c) {
                              a.doParse(a, b, c)
                              }, a);
                  a.localizer(a)
                  },doParse: function(a, b, c) {
                  var e = b.name + " " + a.getPercent(b.value);
                  a.doActing(a, b, null, c, e);
                  a.push("sub_option.id", c);
                  a.get("sub_option.label") && a.push("sub_option.label.text", e);
                  a.push("sub_option.listeners.changed", function(b, c) {
                         a.fireEvent(a, c ? "bound" : "rebound", [a, b.get("name")])
                         });
                  a.sectors.push(a.doSector(a, b))
                  },doSector: function(a) {
                  return new c[a.sub](a.get("sub_option"), a)
                  },dolayout: function(a, b, d, e, f, g) {
                  if (a.is3D() ? c.inEllipse(a.get(a.X) - b, a.topY - d, a.a, a.b) : c.distanceP2P(a.get(a.X), a.topY, b, d) < a.r)
                  d = a.topY - d, e.push("labelx", a.get(a.X) + (2 * Math.sqrt(a.r * a.r - d * d) + f) * (0 == g || 3 == g ? 1 : -1)), e.localizer(e)
                  },localizer: function(a) {
                  if (a.get("intellectLayout")) {
                  var b = [], c = [], e = a.get("layout_distance"), f, g, i;
                  a.sectors.each(function(a) {
                                 a.isLabel() && b.push(a.label)
                                 });
                  b.sor(function(a, b) {
                        return 0 < Math.abs(Math.sin(a.get("angle"))) - Math.abs(Math.sin(b.get("angle")))
                        });
                  b.each(function(b) {
                         c.each(function(c) {
                                g = c.labelx;
                                i = c.labely;
                                if (b.labely <= i && i - b.labely - 1 < b.get(a.H) || b.labely > i && b.labely - i - 1 < c.get(a.H))
                                if (b.labelx < g && g - b.labelx < b.get(a.W) || b.labelx > g && b.labelx - g < c.get(a.W))
                                f = b.get("quadrantd"), b.push("labely", b.get("labely") + i - b.labely + (b.get(a.H) + e) * (1 < f ? -1 : 1)), b.localizer(b), a.dolayout(a, b.get("labelx"), b.get("labely") + b.get(a.H) / 2 * (2 > f ? -1 : 1), b, e, f)
                                }, a);
                         c.push(b)
                         })
                  }
                  },doConfig: function() {
                  c.Pie.superclass.doConfig.call(this);
                  var a = this._(), b = a.get("radius"), d = a.get("sub_option.label") ? 0.35 : 0.44, e = 2 * Math.PI;
                  a.sub = a.is3D() ? "Sector3D" : "Sector2D";
                  a.sectors = [];
                  a.sectors.zIndex = a.get("z_index");
                  a.components.push(a.sectors);
                  a.oA = c.angle2Radian(a.get("offset_angle")) % e;
                  a.is3D() && (d += 0.06);
                  var f = a.data.length, g = c.angle2Radian(c.between(0, 90, a.get("separate_angle"))), i = e - g, g = g / f, j = a.oA + g, k = j;
                  a.data.each(function(b, c) {
                              j += b.value / a.total * i;
                              c == f - 1 && (j = e + a.oA);
                              b.startAngle = k;
                              b.endAngle = j;
                              b.totalAngle = j - k;
                              b.middleAngle = (k + j) / 2;
                              k = j + g
                              }, a);
                  a.r = b = c.parsePercent(b, Math.floor(a.get("minDistance") * d));
                  a.topY = a.originXY(a, [b + a.get("l_originx"), a.get("r_originx") - b, a.get("centerx")], [a.get("centery")]).y;
                  c.apply(a.get("sub_option"), c.clone([a.X, a.Y, "bound_event", "mutex", "increment"], a.options))
                  }});
 c.Pie2D = c.extend(c.Pie, {configure: function() {
                    c.Pie2D.superclass.configure.call(this);
                    this.type = "pie2d"
                    },doConfig: function() {
                    c.Pie2D.superclass.doConfig.call(this);
                    var a = this._();
                    a.push("sub_option.radius", a.r);
                    a.parse(a)
                    }});
 c.Pie3D = c.extend(c.Pie, {configure: function() {
                    c.Pie3D.superclass.configure.apply(this, arguments);
                    this.type = "pie3d";
                    this.dimension = c._3D;
                    this.set({zRotate: 45,yHeight: 30});
                    this.positive = !0
                    },doSector: function(a, b) {
                    a.push("sub_option.cylinder_height", b.cylinder_height ? b.cylinder_height * a.get("zRotate") : a.get("cylinder_height"));
                    return new c[a.sub](a.get("sub_option"), a)
                    },one: function(a) {
                    var b, d, e = [], f = a.get("counterclockwise"), g = function(a, b) {
                    return 1 + Math.sin(b ? a + Math.PI : a)
                    }, i;
                    lay = function(a, d, e, f) {
                    i = c.quadrantd(d);
                    (a && (0 == i || 3 == i) || !a && (2 == i || 1 == i)) && b.push({g: d,z: d == e,x: f.x,y: f.y,a: f.a,b: f.b,color: c.dark(f.get("background_color")),h: f.h,F: f})
                    };
                    a.proxy = new c.Custom({z_index: a.get("z_index") + 1,drawFn: function() {
                                           this.drawSector();
                                           e = [];
                                           a.sectors.each(function(a) {
                                                          a.get("label") && (a.expanded ? e.push(a.label) : a.label.draw())
                                                          });
                                           e.each(function(a) {
                                                  a.draw()
                                                  })
                                           }});
                    a.proxy.drawSector = function() {
                    a.sectors.each(function(b) {
                                   a.T.ellipse(b.x, b.y + b.h, b.a, b.b, b.get("startAngle"), b.get("endAngle"), 0, b.get("border.enable"), b.get("border.width"), b.get("border.color"), b.get("shadow"), f, !0)
                                   }, a);
                    b = [];
                    d = [];
                    a.sectors.each(function(a) {
                                   lay(f, a.get("startAngle"), a.get("endAngle"), a);
                                   lay(!f, a.get("endAngle"), a.get("startAngle"), a);
                                   d = d.concat(c.visible(a.get("startAngle"), a.get("endAngle"), a))
                                   }, a);
                    b.sor(function(a, b) {
                          var c = g(a.g) - g(b.g);
                          return 0 == c ? a.z : 0 < c
                          });
                    b.each(function(b) {
                           a.T.sector3D.layerDraw.call(a.T, b.x, b.y, b.a + 0.5, b.b + 0.5, f, b.h, b.g, b.color)
                           }, a);
                    a.processAnimation || d.sor(function(a, b) {
                                                return 0 > g((a.s + a.e) / 2, 1) - g((b.s + b.e) / 2, 1)
                                                });
                    d.each(function(b) {
                           a.T.sector3D.sPaint.call(a.T, b.f.x, b.f.y, b.f.a, b.f.b, b.s, b.e, f, b.f.h, b.f.get("f_color"))
                           }, a);
                    a.sectors.each(function(b) {
                                   a.T.ellipse(b.x, b.y, b.a, b.b, b.get("startAngle"), b.get("endAngle"), b.get("f_color"), b.get("border.enable"), b.get("border.width"), b.get("border.color"), !1, !1, !0)
                                   }, a)
                    };
                    a.one = c.emptyFn
                    },doConfig: function() {
                    c.Pie3D.superclass.doConfig.call(this);
                    var a = this._(), b = c.angle2Radian(a.get("zRotate"));
                    a.push("cylinder_height", a.get("yHeight") * a.push("zRotate", Math.abs(Math.cos(b))));
                    a.a = a.push("sub_option.semi_major_axis", a.r);
                    a.b = a.push("sub_option.semi_minor_axis", a.r * Math.abs(Math.sin(b)));
                    a.topY = a.push("sub_option.originy", a.get(a.Y) - a.get("yHeight") / 2);
                    a.parse(a);
                    a.one(a);
                    a.components.push(a.proxy)
                    }});
 c.Donut2D = c.extend(c.Pie, {configure: function() {
                      c.Donut2D.superclass.configure.call(this);
                      this.type = "donut2d";
                      this.set({donutwidth: 0.3,center: {text: "",line_height: 24,fontweight: "bold",fontsize: 24}})
                      },doConfig: function() {
                      c.Donut2D.superclass.doConfig.call(this);
                      var a = this._(), b = a.r;
                      a.push("sub_option.radius", b);
                      0 < a.get("donutwidth") && (1 > a.get("donutwidth") ? a.push("donutwidth", Math.floor(b * a.get("donutwidth"))) : a.get("donutwidth") >= b && a.push("donutwidth", 0), a.push("sub_option.donutwidth", a.get("donutwidth")));
                      c.isString(a.get("center")) && a.push("center", c.applyIf({text: a.get("center")}, a.default_.center));
                      "" != a.get("center.text") && (a.push("center.originx", a.get(a.X)), a.push("center.originy", a.get(a.Y)), a.push("center.textBaseline", "middle"), a.center = new c.Text(a.get("center"), a), a.components.push(a.center));
                      a.parse(a)
                      }});
 c.Column = c.extend(c.Chart, {configure: function() {
                     c.Column.superclass.configure.call(this);
                     this.type = "column";
                     this.set({coordinate: {},column_width: void 0,column_space: void 0,text_space: 6,scaleAlign: "left",sub_option: {},label: {}});
                     this.registerEvent()
                     },doAnimation: function(a, b, c) {
                     var e;
                     c.labels.each(function(a) {
                                   a.draw()
                                   });
                     c.rectangles.each(function(f) {
                                       e = Math.ceil(c.animationArithmetic(a, 0, f.height, b));
                                       f.push(c.Y, f.y + (f.height - e));
                                       f.push(c.H, e);
                                       f.drawRectangle()
                                       })
                     },getCoordinate: function() {
                     return this.coo
                     },doLabel: function(a, b, d, e, f) {
                     a.labels.push(new c.Text(c.apply(a.get("label"), {id: b,text: d,originx: e,originy: f}), a))
                     },doParse: function(a, b, c, e) {
                     a.doActing(a, b, e, c)
                     },engine: function(a) {
                     var b = a.get("column_width"), c = a.get("column_space"), e = a.coo.getScale(a.get("scaleAlign")), f = a.coo.get(a.H), g = b / 2, i = b * (a.get("group_fator") || 0), j = "complex" != a.dataType ? b + c : a.data.length * b + c + (a.is3D() ? (a.data.length - 1) * i : 0), k = a.coo.get(a.Y) + f, o = k - e.basic * f - (a.is3D() ? a.get("zHeight") * (a.get("bottom_scale") - 1) / 2 * a.get("yAngle_") : 0), l = c + a.coo.get("x_start"), k = k + a.get("text_space") + a.coo.get("axis.width")[2];
                     a.doEngine(a, b, c, e, f, g, i, j, l, o, k)
                     },doConfig: function() {
                     c.Column.superclass.doConfig.call(this);
                     var a = this._();
                     a.sub = a.is3D() ? "Rectangle3D" : "Rectangle2D";
                     a.rectangles = [];
                     a.labels = [];
                     a.components.push(a.labels);
                     a.components.push(a.rectangles);
                     a.coo = c.Coordinate.coordinate_.call(a, function() {
                                                           var b = a.data.length, c = a.get("coordinate.valid_width"), e, f, g;
                                                           "complex" == a.dataType ? (g = a.get("labels").length, b = g * b + (a.is3D() ? (b - 1) * g * a.get("group_fator") : 0), e = Math.floor(c / (g + 1 + b)), f = a.pushIf("column_width", e), g += 1) : ("stacked" == a.dataType && (b = a.get("labels").length), e = Math.floor(2 * c / (3 * b + 1)), f = a.pushIf("column_width", e), g = b + 1);
                                                           f * b > c && (f = a.push("column_width", e));
                                                           a.push("column_space", (c - f * b) / g);
                                                           a.is3D() && (a.push("zHeight", a.get("column_width") * a.get("zScale")), a.push("sub_option.zHeight", a.get("zHeight")), a.push("sub_option.xAngle_", a.get("xAngle_")), a.push("sub_option.yAngle_", a.get("yAngle_")))
                                                           });
                     a.rectangles.zIndex = a.get("z_index");
                     a.labels.zIndex = a.get("z_index") + 1;
                     a.push("sub_option.width", a.get("column_width"))
                     }});
 c.Column2D = c.extend(c.Column, {configure: function() {
                       c.Column2D.superclass.configure.call(this);
                       this.type = "column2d"
                       },doEngine: function(a, b, d, e, f, g, i, j, k, o, l) {
                       var q;
                       a.data.each(function(b, d) {
                                   q = (b.value - e.start) * f / e.distance;
                                   a.doParse(a, b, d, {id: d,originx: k + d * j,originy: o - (0 < q ? q : 0),height: Math.abs(q)});
                                   a.rectangles.push(new c[a.sub](a.get("sub_option"), a));
                                   a.doLabel(a, d, b.name, k + j * d + g, l)
                                   }, a)
                       },doConfig: function() {
                       c.Column2D.superclass.doConfig.call(this);
                       this.engine(this)
                       }});
 c.Column3D = c.extend(c.Column2D, {configure: function() {
                       c.Column3D.superclass.configure.call(this);
                       this.type = "column3d";
                       this.dimension = c._3D;
                       this.set({coordinate: {},xAngle: 60,yAngle: 20,zScale: 1,bottom_scale: 1.4})
                       },doConfig: function() {
                       c.Column3D.superclass.doConfig.call(this)
                       }});
 c.ColumnMulti2D = c.extend(c.Column, {configure: function() {
                            c.ColumnMulti2D.superclass.configure.call(this);
                            this.type = "columnmulti2d";
                            this.dataType = "complex";
                            this.set({labels: []})
                            },doEngine: function(a, b, d, e, f, g, i, j, k, o, l) {
                            var q;
                            a.columns.each(function(g, r) {
                                           g.item.each(function(d, g) {
                                                       q = (d.value - e.start) * f / e.distance;
                                                       a.doParse(a, d, g, {id: r + "_" + g,originx: k + g * (b + i) + r * j,originy: o - (0 < q ? q : 0),height: Math.abs(q)});
                                                       a.rectangles.push(new c[a.sub](a.get("sub_option"), a))
                                                       }, a);
                                           a.doLabel(a, r, g.name, k - 0.5 * d + (r + 0.5) * j, l)
                                           }, a)
                            },doConfig: function() {
                            c.ColumnMulti2D.superclass.doConfig.call(this);
                            this.engine(this)
                            }});
 c.ColumnMulti3D = c.extend(c.ColumnMulti2D, {configure: function() {
                            c.ColumnMulti3D.superclass.configure.call(this);
                            this.type = "columnmulti3d";
                            this.dataType = "complex";
                            this.dimension = c._3D;
                            this.set({xAngle: 60,yAngle: 20,zScale: 1,group_fator: 0.3,bottom_scale: 1.4})
                            },doConfig: function() {
                            c.ColumnMulti3D.superclass.doConfig.call(this)
                            }});
 c.ColumnStacked2D = c.extend(c.Column, {configure: function() {
                              c.ColumnStacked2D.superclass.configure.call(this);
                              this.type = "columnstacked2d";
                              this.dataType = "stacked";
                              this.set({percent: !1,labels: [],sub_option: {label: {color: "#ffffff"},valueAlign: "middle"}})
                              },doEngine: function(a, b, d, e, f, g, i, j, k, o, l) {
                              var q, m, r, t = a.get("percent");
                              a.columns.each(function(b, g) {
                                             q = 0;
                                             r = t ? 100 / b.total : 1;
                                             b.item.each(function(d, i) {
                                                         m = (d.value * r - e.start) * f / e.distance;
                                                         d.total = b.total;
                                                         a.doParse(a, d, i, {id: g + "_" + i,originx: k + g * j,originy: o - (0 < m ? m : 0) - q,height: Math.abs(m)});
                                                         q += m;
                                                         a.rectangles.push(new c[a.sub](a.get("sub_option"), a))
                                                         }, a);
                                             a.doLabel(a, g, b.name, k - 0.5 * d + (g + 0.5) * j, l)
                                             }, a)
                              },doConfig: function() {
                              c.ColumnStacked2D.superclass.doConfig.call(this);
                              this.engine(this)
                              }});
 c.ColumnStacked3D = c.extend(c.ColumnStacked2D, {configure: function() {
                              c.ColumnStacked3D.superclass.configure.call(this);
                              this.type = "columnstacked3d";
                              this.dataType = "stacked";
                              this.dimension = c._3D;
                              this.set({percent: !1,sub_option: {label: {color: "#ffffff"},valueAlign: "middle"},coordinate: {},xAngle: 60,yAngle: 20,zScale: 1,bottom_scale: 1.4})
                              },doConfig: function() {
                              c.ColumnStacked3D.superclass.doConfig.call(this)
                              }});
 c.Bar = c.extend(c.Chart, {configure: function() {
                  c.Bar.superclass.configure.call(this);
                  this.type = "bar";
                  this.set({coordinate: {striped_direction: "h"},bar_height: void 0,bar_space: void 0,text_space: 6,scaleAlign: "bottom",sub_option: {},label: {}})
                  },getCoordinate: function() {
                  return this.coo
                  },doLabel: function(a, b, d, e) {
                  this.labels.push(new c.Text(c.apply(this.get("label"), {id: a,text: b,textAlign: "right",textBaseline: "middle",originx: d,originy: e}), this))
                  },doParse: function(a, b, c, e) {
                  a.doActing(a, b, e, c)
                  },engine: function(a) {
                  var b = a.get("bar_height"), c = a.get("bar_space"), e = a.coo.getScale(a.get("scaleAlign")), f = a.coo.get(a.W), g = b / 2, i = "complex" != a.dataType ? b + c : a.data.length * b + c, j = a.coo.get(a.X) + e.basic * f, k = a.coo.get(a.X) - a.get("text_space") - a.coo.get("axis.width")[3], o = a.coo.get("y_start") + c;
                  a.doEngine(a, b, c, e, f, g, i, j, k, o)
                  },doAnimation: function(a, b, c) {
                  c.labels.each(function(a) {
                                a.draw()
                                });
                  c.rectangles.each(function(e) {
                                    e.push(c.W, Math.ceil(c.animationArithmetic(a, 0, e.width, b)));
                                    e.drawRectangle()
                                    })
                  },doConfig: function() {
                  c.Bar.superclass.doConfig.call(this);
                  var a = this._();
                  a.coo = c.Coordinate.coordinate_.call(a);
                  a.rectangles = [];
                  a.labels = [];
                  a.rectangles.zIndex = a.get("z_index");
                  a.labels.zIndex = a.get("z_index") + 1;
                  a.components.push(a.labels);
                  a.components.push(a.rectangles);
                  var b = a.data.length, d = a.coo.get("valid_height"), e, f, g;
                  "simple" == a.dataType ? (e = Math.floor(2 * d / (3 * b + 1)), f = a.pushIf("bar_height", e), g = b + 1) : (g = a.get("labels").length, b = g * b + (a.is3D() ? (b - 1) * g * a.get("group_fator") : 0), e = Math.floor(d / (g + 1 + b)), f = a.pushIf("bar_height", e), g += 1);
                  f * b > d && (f = a.push("bar_height", e));
                  a.push("bar_space", (d - f * b) / g);
                  a.push("sub_option.height", f);
                  a.push("sub_option.valueAlign", a.R);
                  a.push("sub_option.tipAlign", a.R)
                  }});
 c.Bar2D = c.extend(c.Bar, {configure: function() {
                    c.Bar2D.superclass.configure.call(this);
                    this.type = "bar2d"
                    },doEngine: function(a, b, d, e, f, g, i, j, k, o) {
                    var l;
                    a.data.each(function(b, d) {
                                l = (b.value - e.start) * f / e.distance;
                                a.doParse(a, b, d, {id: d,originy: o + d * i,width: Math.abs(l),originx: j + (0 < l ? 0 : -Math.abs(l))});
                                a.rectangles.push(new c.Rectangle2D(a.get("sub_option"), a));
                                a.doLabel(d, b.name, k, o + d * i + g)
                                }, a)
                    },doConfig: function() {
                    c.Bar2D.superclass.doConfig.call(this);
                    this.engine(this)
                    }});
 c.BarMulti2D = c.extend(c.Bar, {configure: function() {
                         c.BarMulti2D.superclass.configure.call(this);
                         this.type = "barmulti2d";
                         this.dataType = "complex";
                         this.set({labels: []})
                         },doEngine: function(a, b, d, e, f, g, i, j, k, o) {
                         var l;
                         a.columns.each(function(g, m) {
                                        g.item.each(function(d, g) {
                                                    l = (d.value - e.start) * f / e.distance;
                                                    a.doParse(a, d, g, {id: m + "_" + g,originy: o + g * b + m * i,width: Math.abs(l),originx: j + (0 < l ? 0 : -Math.abs(l))});
                                                    a.rectangles.push(new c.Rectangle2D(a.get("sub_option"), a))
                                                    }, a);
                                        a.doLabel(m, g.name, k, o - 0.5 * d + (m + 0.5) * i)
                                        }, a)
                         },doConfig: function() {
                         c.BarMulti2D.superclass.doConfig.call(this);
                         this.engine(this)
                         }});
 c.LineSegment = c.extend(c.Component, {configure: function() {
                          c.LineSegment.superclass.configure.apply(this, arguments);
                          this.type = "linesegment";
                          this.set({brushsize: 1,intersection: !0,label: {},sign: "round",area_color: null,hollow: !0,hollow_inside: !0,hollow_color: "#FEFEFE",smooth: !1,smoothing: 1.5,point_size: 6,points: [],keep_with_coordinate: !1,shadow_blur: 1,shadow_offsety: 1,point_space: 0,coordinate: null,event_range_x: 0,limit_y: !1,tip_offset: 2,event_range_y: 0});
                          this.registerEvent("parseText");
                          this.tip = null
                          },drawSegment: function() {
                          var a = this._();
                          a.get("points");
                          a.get("f_color");
                          a.get("brushsize");
                          a.polygons.each(function(b) {
                                          a.T.polygon.apply(a.T, b)
                                          });
                          a.T.shadowOn(a.get("shadow"));
                          a.lines.each(function(b) {
                                       a.T.lineArray.apply(a.T, b)
                                       });
                          a.intersections.each(function(b) {
                                               a.sign_plugin ? a.sign_plugin_fn.apply(a, b) : a.T.round0.apply(a.T, b)
                                               });
                          a.get("shadow") && a.T.shadowOff()
                          },doDraw: function(a) {
                          a.drawSegment();
                          a.get("label") && a.labels.each(function(a) {
                                                          a.draw()
                                                          })
                          },isEventValid: function() {
                          },tipInvoke: function() {
                          var a = this.x, b = this.get("tip_offset"), c = this.get("point_size") + b, e = this;
                          return function(f, g, i) {
                          var j = i.left, i = i.top, j = 3 > e.tipPosition && 0 < j - f - a - b || 2 < e.tipPosition && 0 > j - f - a - b ? j - (f + b) : j + b, i = 0 == e.tipPosition % 2 ? i + c : i - g - c;
                          return {left: j,top: i}
                          }
                          },PP: function(a, b, c, e, f, g) {
                          a.get("area") && a.polygons.push([a.get("area_color") || a.get("light_color2"), 0, a.get("brushsize"), 0, 0, a.get("area_opacity"), a.get("smooth") ? b : [{x: c,y: e}].concat(b.concat([{x: f,y: g}])), a.get("smooth"), a.get("smoothing") || 1.5, [{x: c,y: e}, {x: f,y: g}]])
                          },parse: function(a) {
                          a.polygons = [];
                          a.lines = [];
                          a.intersections = [];
                          a.labels = [];
                          var b = a.get("points"), d = a.get("intersection"), e = !!a.get("label"), f = [], g = !1, i = a.get("smooth"), j = a.get("smoothing") || 1.5, k = a.get("f_color"), o = a.get("brushsize"), l = a.get("point_size");
                          if (d) {
                          var q = a.getPlugin("sign"), m = k, r = a.get("hollow_color");
                          a.sign_plugin = c.isFunction(q);
                          a.sign_plugin_fn = q;
                          a.get("hollow_inside") && (m = r, r = k)
                          }
                          b.each(function(b) {
                                 b.x_ = b.x;
                                 b.y_ = b.y;
                                 !b.ignored && e && (a.push("label.originx", b.x), a.push("label.originy", b.y - l / 2 - 1), a.push("label.text", a.fireString(a, "parseText", [a, b.value], b.value)), c.applyIf(a.get("label"), {textBaseline: "bottom",color: a.get("f_color")}), a.labels.push(new c.Text(a.get("label"), a)));
                                 b.ignored && g ? (a.lines.push([f, o, k, i, j]), a.PP(a, f, f[0].x, a.y, f[f.length - 1].x, a.y), f = [], g = !1) : b.ignored || (f.push(b), g = !0);
                                 d && !b.ignored && a.intersections.push(a.sign_plugin ? [a.T, a.get("sign"), b, l, m, r] : a.get("hollow") ? [b, l / 2 - o + 1, m, o + 1, r] : [b, l / 2, m])
                                 });
                          f.length && (a.lines.push([f, o, k, i, j]), a.PP(a, f, f[0].x, a.y, f[f.length - 1].x, a.y))
                          },doConfig: function() {
                          c.LineSegment.superclass.doConfig.call(this);
                          c.Assert.isTrue(0 < this.get("point_space"), "point_space");
                          var a = this._(), b = 3 * a.get("point_size") / 2, d = a.get("point_space"), e = a.get("event_range_y"), f = a.get("event_range_x"), g = a.get("tipInvokeHeap"), i = a.get("points"), j = a.get("name");
                          a.parse(a);
                          if (0 >= f || f > d / 2)
                          f = a.push("event_range_x", d / 2);
                          0 == e && (e = a.push("event_range_y", b / 2));
                          a.get("tip.enable") && (a.on("mouseover", function() {
                                                       g.push(a);
                                                       a.tipPosition = g.length
                                                       }).on("mouseout", function() {
                                                             g.pop()
                                                             }), a.push("tip.invokeOffsetDynamic", !0), a.tip = new c.Tip(a.get("tip"), a));
                          var k = a.get("coordinate"), o = a.get("limit_y"), l = a.get("keep_with_coordinate"), q = function(a, b, c) {
                          return !a.ignored && Math.abs(b - a.x) < f && (!o || o && Math.abs(c - a.y) < e) ? true : false
                          }, m = function(a) {
                          return {valid: true,name: j,value: i[a].value,text: i[a].text,top: i[a].y,left: i[a].x,i: a,hit: true}
                          };
                          a.isEventValid = function(b) {
                          if (k && !k.isEventValid(b, k).valid)
                          return {valid: false};
                          var e = Math.floor((b.x - a.x) / d);
                          if (e < 0 || e >= i.length - 1) {
                          e = c.between(0, i.length - 1, e);
                          return q(i[e], b.x, b.y) ? m(e) : {valid: l}
                          }
                          for (var f = e; f <= e + 1; f++)
                          if (q(i[f], b.x, b.y))
                          return m(f);
                          return {valid: l}
                          }
                          }});
 c.Line = c.extend(c.Chart, {configure: function() {
                   c.Line.superclass.configure.call(this);
                   this.type = "line";
                   this.set({brushsize: 1,coordinate: {axis: {width: [0, 0, 2, 2]}},crosshair: {enable: !1},tipMocker: null,tipMockerOffset: null,scaleAlign: "left",labelAlign: "bottom",labels: [],label_space: 6,proportional_spacing: !0,point_space: null,sub_option: {},legend: {sign: "bar"},label: {}});
                   this.registerEvent("parsePoint")
                   },getCoordinate: function() {
                   return this.coo
                   },doConfig: function() {
                   c.Line.superclass.doConfig.call(this);
                   var a = this._(), b = 1 == a.data.length;
                   a.lines = [];
                   a.lines.zIndex = a.get("z_index");
                   a.components.push(a.lines);
                   var d = a.pushIf("sub_option.keep_with_coordinate", b);
                   a.get("crosshair.enable") && (a.push("crosshair.hcross", b), a.push("crosshair.invokeOffset", function(b) {
                                                                                       b = a.lines[0].isEventValid(b);
                                                                                       return b.valid ? b : d
                                                                                       }));
                   a.Combination || (a.push("coordinate.crosshair", a.get("crosshair")), a.pushIf("coordinate.scale", [{position: a.get("scaleAlign"),max_scale: a.get("maxValue")}, {position: a.get("labelAlign"),start_scale: 1,scale: 1,end_scale: a.get("maxItemSize"),labels: a.get("labels"),label: a.get("label")}]));
                   a.coo = c.Coordinate.coordinate_.call(a);
                   a.Combination && (a.coo.push("crosshair", a.get("crosshair")), a.coo.doCrosshair(a.coo));
                   var b = a.coo.get("valid_width"), e = a.coo.get("valid_height"), f = b / (a.get("maxItemSize") - 1), g = a.get("point_space");
                   a.get("proportional_spacing") && (g && g < f ? b = (a.get("maxItemSize") - 1) * g : a.push("point_space", f));
                   a.push("sub_option.width", b);
                   a.push("sub_option.height", e);
                   a.push("sub_option.originx", a.coo.get("x_start") + (a.coo.get("valid_width") - b) / 2);
                   a.push("sub_option.originy", a.coo.get(a.Y) + a.coo.get(a.H));
                   if (a.get("tip.enable") && c.isFunction(a.get("tipMocker"))) {
                   a.push("sub_option.tip.enable", !1);
                   a.push("tip.invokeOffsetDynamic", !0);
                   var i, j = a.coo.get(a.X), k = a.coo.get(a.Y), o = a.coo.get(a.H), l = a.get("tipMockerOffset"), q, m, r, l = c.isNumber(l) ? 0 > l ? 0 : 1 < l ? 1 : l : null;
                   a.push("tip.invokeOffset", function(a, b, c) {
                          if (l != null)
                          c.top = k + (o - b) * l;
                          else {
                          c.top = c.maxTop - (c.maxTop - c.minTop) / 3 - b;
                          if (b > o || k > c.top)
                          c.top = k
                          }
                          return {left: c.left - a - j > 5 ? c.left - a - 5 : c.left + 5,top: c.top}
                          });
                   var t = a.get("tip.listeners.parseText");
                   t && delete a.get("tip.listeners").parseText;
                   b = new c.Custom({eventValid: function(b) {
                                    m = a.lines[0].isEventValid(b);
                                    m.hit = q != m.i;
                                    if (m.valid) {
                                    q = m.i;
                                    i = [];
                                    a.lines.each(function(a, c) {
                                                 r = a.isEventValid(b);
                                                 if (c == 0)
                                                 m.minTop = m.maxTop = r.top;
                                                 else {
                                                 m.minTop = Math.min(m.minTop, r.top);
                                                 m.maxTop = Math.max(m.maxTop, r.top)
                                                 }
                                                 i.push(t ? t(null, r.name, r.value, r.text, r.i) : r.name + " " + r.value)
                                                 });
                                    m.text = a.get("tipMocker").call(a, i, m.i) || "tipMocker not return"
                                    }
                                    return m.valid ? m : false
                                    }});
                   new c.Tip(a.get("tip"), b);
                   a.components.push(b)
                   }
                   c.applyIf(a.get("sub_option"), c.clone(["area_opacity"], a.options))
                   }});
 c.LineBasic2D = c.extend(c.Line, {configure: function() {
                          c.LineBasic2D.superclass.configure.call(this);
                          this.type = "basicline2d";
                          this.tipInvokeHeap = []
                          },doAnimation: function(a, b, c) {
                          c.lines.each(function(e) {
                                       e.get("points").each(function(f) {
                                                            f.y = e.y - Math.ceil(c.animationArithmetic(a, 0, e.y - f.y_, b))
                                                            });
                                       e.drawSegment()
                                       })
                          },doConfig: function() {
                          c.LineBasic2D.superclass.doConfig.call(this);
                          var a = this._(), b, d = a.coo.get("valid_height"), e = a.get("point_space"), f, g, i, j = a.get("sub_option.originx"), k, o;
                          a.push("sub_option.tip.showType", "follow");
                          a.push("sub_option.coordinate", a.coo);
                          a.push("sub_option.tipInvokeHeap", a.tipInvokeHeap);
                          a.push("sub_option.point_space", e);
                          a.data.each(function(l) {
                                      b = a.coo.getScale(l.scaleAlign || a.get("scaleAlign"));
                                      k = a.get("sub_option.originy") - b.basic * d;
                                      f = [];
                                      l.value.each(function(q, m) {
                                                   g = e * m;
                                                   i = (q - b.start) * d / b.distance;
                                                   o = {x: j + g,y: k - i,value: q,text: l.name + " " + q};
                                                   c.merge(o, a.fireEvent(a, "parsePoint", [l, q, g, i, m]));
                                                   f.push(o)
                                                   }, a);
                                      c.merge(a.get("sub_option"), l);
                                      a.push("sub_option.points", f);
                                      a.push("sub_option.brushsize", l.linewidth || l.line_width || 1);
                                      a.lines.push(new c.LineSegment(a.get("sub_option"), a))
                                      }, this)
                          }});
 c.Area2D = c.extend(c.LineBasic2D, {configure: function() {
                     c.Area2D.superclass.configure.call(this);
                     this.type = "area2d";
                     this.set({area_opacity: 0.3})
                     },doConfig: function() {
                     this.push("sub_option.area", !0);
                     c.Area2D.superclass.doConfig.call(this)
                     }})
 })(iChart);