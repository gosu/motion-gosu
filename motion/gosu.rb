module Gosu
  def self.draw_line(x1, y1, c1, x2, y2, c2, z = 0, mode = :default)
    GSKGraphics.drawLineFromX(x1, y: y1, color: c1, toX: x2, y: y2, color: c2,
      z: z, mode: ALPHA_MODE_MAP[mode])
  end
  
  def self.draw_quad(x1, y1, c1, x2, y2, c2, x3, y3, c3, x4, y4, c4, z = 0,
      mode = :default)
    
    GSKGraphics.drawQuadWithX(x1, y: y1, color: c1, x: x2, y: y2, color: c2,
      x: x3, y: y3, color: c3, x: x4, y: y4, color: c4,
      z: z, mode: ALPHA_MODE_MAP[mode])
  end
  
  def self.draw_rect(x, y, width, height, c, z = 0, mode = :default)
    GSKGraphics.drawRectAtX(x, y: y, width: width, height: height, color: c,
      z: z, mode: ALPHA_MODE_MAP[mode])
  end
  
  def self.draw_triangle(x1, y1, c1, x2, y2, c2, x3, y3, c3, z = 0, mode = :default)
    GSKGraphics.drawTriangleWithX(x1, y: y1, color: c1, x: x2, y: y2, color: c2,
      x: x3, y: y3, color: c3,
      z: z, mode: ALPHA_MODE_MAP[mode])
  end
  
  def self.clip_to(x, y, w, h, &block)
    GSKGraphics.clipToX(x, y: y, width: w, height: h, perform: block)
  end
  
  def self.flush
    GSKGraphics.flush()
  end
  
  def self.gl(&block)
    GSKGraphics.performGL(block)
  end
  
  def self.record(width, height, &block)
    Gosu::Image.imageFromMacroWithWidth(width, height: height, record: block)
  end
  
  def self.rotate(angle, around_x = 0, around_y = 0, &block)
    GSKGraphics.rotate(angle, aroundX: around_x, aroundY: around_y, perform: block)
  end
  
  def self.scale(scale_x, scale_y = scale_x, around_x = 0, around_y = 0, &block)
    GSKGraphics.scaleX(scale_x, y: scale_y,
      aroundX: around_x, aroundY: around_y, perform: block)
  end
  
  def self.transform(*matrix, &block)
    # TODO - not sure how to create a CGFloat* from matrix
    GSKGraphics.transform(nil, perform: block);
  end
  
  def self.translate(x, y, &block)
    GSKGraphics.translateX(x, y: y, perform: block)
  end
  
  def self.angle(x1, y1, x2, y2)
    GSKGetAngle(x1, y1, x2, y2)
  end
  
  def self.angle_diff(angle1, angle2)
    GSKGetAngleDifference(angle1, angle2)
  end
  
  def self.available_height(window = nil)
    GSKGetAvailableHeight()
  end
  
  def self.available_width(window = nil)
    GSKGetAvailableWidth()
  end
  
  def self.button_down?(id)
    GSKIsButtonDown(id)
  end
  
  def self.button_id_to_char(id)
    GSKGetCharacterFromButtonID(id).chr
  end
  
  def self.char_to_button_id(char)
    GSKGetButtonIDFromCharacter(char.ord)
  end
  
  def self.distance(x1, y1, x2, y2)
    GSKGetDistance(x1, y1, x2, y2)
  end
  
  def self.default_font_name
    GSKGetDefaultFontName()
  end
  
  def self.fps
    GSKGetFramesPerSecond()
  end
  
  def self.language
    GSKGetLanguage()
  end
  
  def self.milliseconds
    GSKGetMilliseconds()
  end
  
  def self.offset_x(theta, r)
    GSKGetOffsetX(theta, r)
  end
  
  def self.offset_y(theta, r)
    GSKGetOffsetY(theta, r)
  end
  
  def self.random(min, max)
    GSKRandom(min, max)
  end
  
  def self.screen_height(window = nil)
    GSKGetScreenHeight()
  end
  
  def self.screen_width(window = nil)
    GSKGetScreenWidth()
  end
  
  # List of constants generated with:
  # ruby -rgosu -e 'Gosu.constants.grep(/^(GP_|KB_|MS_)/).each { |c| puts "  #{c.to_s} = #{Gosu::const_get(c)}" }'
  KB_ESCAPE = 41
  KB_F1 = 58
  KB_F2 = 59
  KB_F3 = 60
  KB_F4 = 61
  KB_F5 = 62
  KB_F6 = 63
  KB_F7 = 64
  KB_F8 = 65
  KB_F9 = 66
  KB_F10 = 67
  KB_F11 = 68
  KB_F12 = 69
  KB_0 = 39
  KB_1 = 30
  KB_2 = 31
  KB_3 = 32
  KB_4 = 33
  KB_5 = 34
  KB_6 = 35
  KB_7 = 36
  KB_8 = 37
  KB_9 = 38
  KB_TAB = 43
  KB_RETURN = 40
  KB_SPACE = 44
  KB_LEFT_SHIFT = 225
  KB_RIGHT_SHIFT = 229
  KB_LEFT_CONTROL = 224
  KB_RIGHT_CONTROL = 228
  KB_LEFT_ALT = 226
  KB_RIGHT_ALT = 230
  KB_LEFT_META = 227
  KB_RIGHT_META = 231
  KB_BACKSPACE = 42
  KB_LEFT = 80
  KB_RIGHT = 79
  KB_UP = 82
  KB_DOWN = 81
  KB_HOME = 74
  KB_END = 77
  KB_INSERT = 73
  KB_DELETE = 76
  KB_PAGE_UP = 75
  KB_PAGE_DOWN = 78
  KB_ENTER = 88
  KB_BACKTICK = 53
  KB_MINUS = 45
  KB_EQUALS = 46
  KB_LEFT_BRACKET = 47
  KB_RIGHT_BRACKET = 48
  KB_BACKSLASH = 49
  KB_SEMICOLON = 51
  KB_APOSTROPHE = 52
  KB_COMMA = 54
  KB_PERIOD = 55
  KB_SLASH = 56
  KB_A = 4
  KB_B = 5
  KB_C = 6
  KB_D = 7
  KB_E = 8
  KB_F = 9
  KB_G = 10
  KB_H = 11
  KB_I = 12
  KB_J = 13
  KB_K = 14
  KB_L = 15
  KB_M = 16
  KB_N = 17
  KB_O = 18
  KB_P = 19
  KB_Q = 20
  KB_R = 21
  KB_S = 22
  KB_T = 23
  KB_U = 24
  KB_V = 25
  KB_W = 26
  KB_X = 27
  KB_Y = 28
  KB_Z = 29
  KB_ISO = 100
  KB_NUMPAD_0 = 98
  KB_NUMPAD_1 = 89
  KB_NUMPAD_2 = 90
  KB_NUMPAD_3 = 91
  KB_NUMPAD_4 = 92
  KB_NUMPAD_5 = 93
  KB_NUMPAD_6 = 94
  KB_NUMPAD_7 = 95
  KB_NUMPAD_8 = 96
  KB_NUMPAD_9 = 97
  KB_NUMPAD_PLUS = 87
  KB_NUMPAD_MINUS = 86
  KB_NUMPAD_MULTIPLY = 85
  KB_NUMPAD_DIVIDE = 84
  MS_LEFT = 256
  MS_MIDDLE = 257
  MS_RIGHT = 258
  MS_WHEEL_UP = 259
  MS_WHEEL_DOWN = 260
  MS_OTHER_0 = 261
  MS_OTHER_1 = 262
  MS_OTHER_2 = 263
  MS_OTHER_3 = 264
  MS_OTHER_4 = 265
  MS_OTHER_5 = 266
  MS_OTHER_6 = 267
  MS_OTHER_7 = 268
  GP_LEFT = 273
  GP_RIGHT = 274
  GP_UP = 275
  GP_DOWN = 276
  GP_BUTTON_0 = 277
  GP_BUTTON_1 = 278
  GP_BUTTON_2 = 279
  GP_BUTTON_3 = 280
  GP_BUTTON_4 = 281
  GP_BUTTON_5 = 282
  GP_BUTTON_6 = 283
  GP_BUTTON_7 = 284
  GP_BUTTON_8 = 285
  GP_BUTTON_9 = 286
  GP_BUTTON_10 = 287
  GP_BUTTON_11 = 288
  GP_BUTTON_12 = 289
  GP_BUTTON_13 = 290
  GP_BUTTON_14 = 291
  GP_BUTTON_15 = 292
  GP_0_LEFT = 293
  GP_0_RIGHT = 294
  GP_0_UP = 295
  GP_0_DOWN = 296
  GP_0_BUTTON_0 = 297
  GP_0_BUTTON_1 = 298
  GP_0_BUTTON_2 = 299
  GP_0_BUTTON_3 = 300
  GP_0_BUTTON_4 = 301
  GP_0_BUTTON_5 = 302
  GP_0_BUTTON_6 = 303
  GP_0_BUTTON_7 = 304
  GP_0_BUTTON_8 = 305
  GP_0_BUTTON_9 = 306
  GP_0_BUTTON_10 = 307
  GP_0_BUTTON_11 = 308
  GP_0_BUTTON_12 = 309
  GP_0_BUTTON_13 = 310
  GP_0_BUTTON_14 = 311
  GP_0_BUTTON_15 = 312
  GP_1_LEFT = 313
  GP_1_RIGHT = 314
  GP_1_UP = 315
  GP_1_DOWN = 316
  GP_1_BUTTON_0 = 317
  GP_1_BUTTON_1 = 318
  GP_1_BUTTON_2 = 319
  GP_1_BUTTON_3 = 320
  GP_1_BUTTON_4 = 321
  GP_1_BUTTON_5 = 322
  GP_1_BUTTON_6 = 323
  GP_1_BUTTON_7 = 324
  GP_1_BUTTON_8 = 325
  GP_1_BUTTON_9 = 326
  GP_1_BUTTON_10 = 327
  GP_1_BUTTON_11 = 328
  GP_1_BUTTON_12 = 329
  GP_1_BUTTON_13 = 330
  GP_1_BUTTON_14 = 331
  GP_1_BUTTON_15 = 332
  GP_2_LEFT = 333
  GP_2_RIGHT = 334
  GP_2_UP = 335
  GP_2_DOWN = 336
  GP_2_BUTTON_0 = 337
  GP_2_BUTTON_1 = 338
  GP_2_BUTTON_2 = 339
  GP_2_BUTTON_3 = 340
  GP_2_BUTTON_4 = 341
  GP_2_BUTTON_5 = 342
  GP_2_BUTTON_6 = 343
  GP_2_BUTTON_7 = 344
  GP_2_BUTTON_8 = 345
  GP_2_BUTTON_9 = 346
  GP_2_BUTTON_10 = 347
  GP_2_BUTTON_11 = 348
  GP_2_BUTTON_12 = 349
  GP_2_BUTTON_13 = 350
  GP_2_BUTTON_14 = 351
  GP_2_BUTTON_15 = 352
  GP_3_LEFT = 353
  GP_3_RIGHT = 354
  GP_3_UP = 355
  GP_3_DOWN = 356
  GP_3_BUTTON_0 = 357
  GP_3_BUTTON_1 = 358
  GP_3_BUTTON_2 = 359
  GP_3_BUTTON_3 = 360
  GP_3_BUTTON_4 = 361
  GP_3_BUTTON_5 = 362
  GP_3_BUTTON_6 = 363
  GP_3_BUTTON_7 = 364
  GP_3_BUTTON_8 = 365
  GP_3_BUTTON_9 = 366
  GP_3_BUTTON_10 = 367
  GP_3_BUTTON_11 = 368
  GP_3_BUTTON_12 = 369
  GP_3_BUTTON_13 = 370
  GP_3_BUTTON_14 = 371
  GP_3_BUTTON_15 = 372
end
