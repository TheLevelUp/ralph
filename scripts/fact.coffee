# Description:
#   Fact facts
# Commands:
#   hubot fact - Retuns a fact fact
# Facts from http://en.wikipedia.org/wiki/Fact
module.exports = (robot) ->
  robot.respond /fact/i, (msg) ->
    quotes = [
      'The word fact derives from the Latin factum, and was first used in English with the same meaning: "a thing done or performed", a use that is now obsolete.[1] The common usage of "something that has really occurred or is the case" dates from the middle of the sixteenth century.',
      'Fact is sometimes used synonymously with truth, as distinct from opinions, falsehoods, or matters of taste. This use is found in such phrases as, It is a fact that the cup is blue or Matter of fact, and "... not history, nor fact, but imagination." Filmmaker Werner Herzog distinguishes clearly between the two, claiming that "fact creates norms, and truth illumination".'
      'Fact also indicates a matter under discussion deemed to be true or correct, such as to emphasize a point or prove a disputed issue; (e.g., "... the fact of the matter is ...").',
      'Fact may also indicate an allegation or stipulation of something that may or may not be a "true fact", (e.g., "the author\'s facts are not trustworthy"). This alternate usage, although contested by some, has a long history in standard English.',
      'Fact may also indicate findings derived through a process of evaluation, including review of testimony, direct observation, or otherwise; as distinguishable from matters of inference or speculation. This use is reflected in the terms "fact-find" and "fact-finder" (e.g., "set up a fact-finding commission").',
      'Facts may be checked by reason, experiment, personal experience, or may be argued from authority. Roger Bacon wrote "If in other sciences we should arrive at certainty without doubt and truth without error, it behooves us to place the foundations of knowledge in mathematics."'
      'In philosophy, the concept fact is considered in epistemology and ontology. Questions of objectivity and truth are closely associated with questions of fact. A "fact" can be defined as something which is the case, that is, a state of affairs.',
      'Facts may be understood as that which makes a true sentence true. Facts may also be understood as those things to which a true sentence refers. The statement "Jupiter is the largest planet in the solar system" is about the fact Jupiter is the largest planet in the solar system.'
    ]
    msg.send msg.random quotes
