# Description:
#   Allows Hubot to know many languages.
#
# Commands:
#   hubot translate me <phrase> - Searches for a translation for the <phrase> and then prints that bad boy out.
#   hubot translate me from <source> into <target> <phrase> - Translates <phrase> from <source> into <target>. Both <source> and <target> are optional

http = require 'scoped-http-client'
_ = require 'underscore'

languages =
  'af': 'Afrikaans',
  'sq': 'Albanian',
  'ar': 'Arabic',
  'az': 'Azerbaijani',
  'eu': 'Basque',
  'bn': 'Bengali',
  'be': 'Belarusian',
  'bg': 'Bulgarian',
  'ca': 'Catalan',
  'zh-CN': 'Simplified Chinese',
  'zh-TW': 'Traditional Chinese',
  'hr': 'Croatian',
  'cs': 'Czech',
  'da': 'Danish',
  'nl': 'Dutch',
  'en': 'English',
  'eo': 'Esperanto',
  'et': 'Estonian',
  'tl': 'Filipino',
  'fi': 'Finnish',
  'fr': 'French',
  'gl': 'Galician',
  'ka': 'Georgian',
  'de': 'German',
  'el': 'Greek',
  'gu': 'Gujarati',
  'ht': 'Haitian Creole',
  'iw': 'Hebrew',
  'hi': 'Hindi',
  'hu': 'Hungarian',
  'is': 'Icelandic',
  'id': 'Indonesian',
  'ga': 'Irish',
  'it': 'Italian',
  'ja': 'Japanese',
  'kn': 'Kannada',
  'ko': 'Korean',
  'la': 'Latin',
  'lv': 'Latvian',
  'lt': 'Lithuanian',
  'mk': 'Macedonian',
  'ms': 'Malay',
  'mt': 'Maltese',
  'no': 'Norwegian',
  'fa': 'Persian',
  'pl': 'Polish',
  'pt': 'Portuguese',
  'ro': 'Romanian',
  'ru': 'Russian',
  'sr': 'Serbian',
  'sk': 'Slovak',
  'sl': 'Slovenian',
  'es': 'Spanish',
  'sw': 'Swahili',
  'sv': 'Swedish',
  'ta': 'Tamil',
  'te': 'Telugu',
  'th': 'Thai',
  'tr': 'Turkish',
  'uk': 'Ukranian',
  'ur': 'Urdu',
  'vi': 'Vietnamese',
  'cy': 'Welsh',
  'yi': 'Yiddish'

garble = (phrase, garbles, callback) ->
  if garbles.length > 0
    from = 'en'
    to = _(garbles).first()
    garbles = _(garbles).rest(1)

    translate phrase, from, to, (translation) ->
      translate translation, to, from, (translation) ->
        garble translation, garbles, callback
  else
    callback phrase

getCode = (language, languages) ->
  for code, lang of languages
    return code if lang.toLowerCase() is language.toLowerCase()

translate = (phrase, from, to, callback) ->
  params =
    client: 't'
    hl: 'en'
    ie: 'UTF-8'
    multires: 1
    oc: 1
    oe: 'UTF-8'
    otf: 2
    sc: 2
    sl: from
    ssel: 3
    tl: to
    tsel: 6
    uptl: 'en'
    q: phrase

  http.create('http://translate.google.com/translate_a/t')
    .header('User-Agent', 'Mozilla/5.0')
    .query(params)
    .get() (err, res, body) ->
      if body.length > 4 and body[0] == '['
        response = eval(body)
        translation = response[0][0][0]
        callback translation

module.exports = (robot) ->
  robot.respond /(?:garble)(?: me)? (.*)/i, (msg) ->
    phrase = msg.match[1]
    severity = Math.floor(Math.random() * (5 - 2 + 1) + 2)
    garbles = _.chain(languages).keys().sample(severity).value()

    garble phrase, garbles, (translation) ->
      garbles = _.map garbles, (key) ->
        languages[key]
      msg.send "#{translation} (#{garbles.join(' → ')})"

  robot.respond /(?:translate)(?: me)?(?:(?: from) ([a-z]*))?(?:(?: (?:in)?to) ([a-z]*))? (.*)/i, (msg) ->
    from = if msg.match[1] isnt undefined then getCode(msg.match[1], languages) else 'en'
    to = if msg.match[2] isnt undefined then getCode(msg.match[2], languages) else 'en'
    phrase = msg.match[3]

    translate phrase, from, to, (translation) ->
      msg.send translation
