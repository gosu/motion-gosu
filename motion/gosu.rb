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
  
  def self.available_height
    GSKGetAvailableHeight()
  end
  
  def self.available_width
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
  
  def self.screen_height
    GSKGetScreenHeight()
  end
  
  def self.screen_width
    GSKGetScreenWidth()
  end
  
  # List of constants generated with:
  # ruby -rgosu -e 'Gosu.constants.grep(/^(Gp|Kb|Ms)/).each { |c| puts "    #{c.to_s} = #{Gosu::const_get(c)}" }'
  KbEscape = 41
  KbF1 = 58
  KbF2 = 59
  KbF3 = 60
  KbF4 = 61
  KbF5 = 62
  KbF6 = 63
  KbF7 = 64
  KbF8 = 65
  KbF9 = 66
  KbF10 = 67
  KbF11 = 68
  KbF12 = 69
  Kb0 = 39
  Kb1 = 30
  Kb2 = 31
  Kb3 = 32
  Kb4 = 33
  Kb5 = 34
  Kb6 = 35
  Kb7 = 36
  Kb8 = 37
  Kb9 = 38
  KbTab = 43
  KbReturn = 40
  KbSpace = 44
  KbLeftShift = 225
  KbRightShift = 229
  KbLeftControl = 224
  KbRightControl = 228
  KbLeftAlt = 226
  KbRightAlt = 230
  KbLeftMeta = 227
  KbRightMeta = 231
  KbBackspace = 42
  KbLeft = 80
  KbRight = 79
  KbUp = 82
  KbDown = 81
  KbHome = 74
  KbEnd = 77
  KbInsert = 73
  KbDelete = 76
  KbPageUp = 75
  KbPageDown = 78
  KbEnter = 88
  KbBacktick = 53
  KbMinus = 45
  KbEqual = 46
  KbBracketLeft = 47
  KbBracketRight = 48
  KbBackslash = 49
  KbSemicolon = 51
  KbApostrophe = 52
  KbComma = 54
  KbPeriod = 55
  KbSlash = 49
  KbA = 4
  KbB = 5
  KbC = 6
  KbD = 7
  KbE = 8
  KbF = 9
  KbG = 10
  KbH = 11
  KbI = 12
  KbJ = 13
  KbK = 14
  KbL = 15
  KbM = 16
  KbN = 17
  KbO = 18
  KbP = 19
  KbQ = 20
  KbR = 21
  KbS = 22
  KbT = 23
  KbU = 24
  KbV = 25
  KbW = 26
  KbX = 27
  KbY = 28
  KbZ = 29
  KbISO = 100
  KbNumpad0 = 98
  KbNumpad1 = 89
  KbNumpad2 = 90
  KbNumpad3 = 91
  KbNumpad4 = 92
  KbNumpad5 = 93
  KbNumpad6 = 94
  KbNumpad7 = 95
  KbNumpad8 = 96
  KbNumpad9 = 97
  KbNumpadAdd = 87
  KbNumpadSubtract = 86
  KbNumpadMultiply = 85
  KbNumpadDivide = 84
  MsLeft = 256
  MsMiddle = 257
  MsRight = 258
  MsWheelUp = 259
  MsWheelDown = 260
  MsOther0 = 261
  MsOther1 = 262
  MsOther2 = 263
  MsOther3 = 264
  MsOther4 = 265
  MsOther5 = 266
  MsOther6 = 267
  MsOther7 = 268
  GpLeft = 273
  GpRight = 274
  GpUp = 275
  GpDown = 276
  GpButton0 = 277
  GpButton1 = 278
  GpButton2 = 279
  GpButton3 = 280
  GpButton4 = 281
  GpButton5 = 282
  GpButton6 = 283
  GpButton7 = 284
  GpButton8 = 285
  GpButton9 = 286
  GpButton10 = 287
  GpButton11 = 288
  GpButton12 = 289
  GpButton13 = 290
  GpButton14 = 291
  GpButton15 = 292
  Gp0Left = 293
  Gp0Right = 294
  Gp0Up = 295
  Gp0Down = 296
  Gp0Button0 = 297
  Gp0Button1 = 298
  Gp0Button2 = 299
  Gp0Button3 = 300
  Gp0Button4 = 301
  Gp0Button5 = 302
  Gp0Button6 = 303
  Gp0Button7 = 304
  Gp0Button8 = 305
  Gp0Button9 = 306
  Gp0Button10 = 307
  Gp0Button11 = 308
  Gp0Button12 = 309
  Gp0Button13 = 310
  Gp0Button14 = 311
  Gp0Button15 = 312
  Gp1Left = 313
  Gp1Right = 314
  Gp1Up = 315
  Gp1Down = 316
  Gp1Button0 = 317
  Gp1Button1 = 318
  Gp1Button2 = 319
  Gp1Button3 = 320
  Gp1Button4 = 321
  Gp1Button5 = 322
  Gp1Button6 = 323
  Gp1Button7 = 324
  Gp1Button8 = 325
  Gp1Button9 = 326
  Gp1Button10 = 327
  Gp1Button11 = 328
  Gp1Button12 = 329
  Gp1Button13 = 330
  Gp1Button14 = 331
  Gp1Button15 = 332
  Gp2Left = 333
  Gp2Right = 334
  Gp2Up = 335
  Gp2Down = 336
  Gp2Button0 = 337
  Gp2Button1 = 338
  Gp2Button2 = 339
  Gp2Button3 = 340
  Gp2Button4 = 341
  Gp2Button5 = 342
  Gp2Button6 = 343
  Gp2Button7 = 344
  Gp2Button8 = 345
  Gp2Button9 = 346
  Gp2Button10 = 347
  Gp2Button11 = 348
  Gp2Button12 = 349
  Gp2Button13 = 350
  Gp2Button14 = 351
  Gp2Button15 = 352
  Gp3Left = 353
  Gp3Right = 354
  Gp3Up = 355
  Gp3Down = 356
  Gp3Button0 = 357
  Gp3Button1 = 358
  Gp3Button2 = 359
  Gp3Button3 = 360
  Gp3Button4 = 361
  Gp3Button5 = 362
  Gp3Button6 = 363
  Gp3Button7 = 364
  Gp3Button8 = 365
  Gp3Button9 = 366
  Gp3Button10 = 367
  Gp3Button11 = 368
  Gp3Button12 = 369
  Gp3Button13 = 370
  Gp3Button14 = 371
  Gp3Button15 = 372
end
