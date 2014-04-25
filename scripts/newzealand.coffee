# Description:
#   New zealand meme
# Commands:
#   hubot new zealand - Retuns a fact about New Zealand
module.exports = (robot) ->
  robot.respond /new zealand/i, (msg) ->
    quotes = [
      "While it is no longer the case, New Zealand was once governed as a part of the territory of New South Wales (later a part of Australia). When Australia federated in 1901, New Zealand was offered a place as one of their states. New Zealand refused and is its own country with no ties (other than economic and commonwealth) to Australia.",
      "A kiwi is not a fruit – it is New Zealand’s native flightless bird (pictured above) and a slang term for a New Zealander. Kiwis call the fruit “kiwifruit” – they are also known as Chinese Gooseberries.",
      "New Zealand was the first major nation to have universal suffrage. In 1893 it became legal for all male and female citizens of New Zealand to vote.",
      "New Zealand was first discovered by Europeans in 1642 when Dutch sailor Abel Tasman arrived. He left New Zealand after several of his crew were killed by Maoris, and it was not until 1769 that English Captain James Cook arrived and mapped the land.",
      "Queen Elizabeth II is officially Queen of New Zealand. She is represented in New",
      "New Zealand is one of only three countries that have two official (and of equal standing) national Anthems. The first is God Save the Queen (the English National Anthem) and the other is God Defend New Zealand. The other two countries with two anthems are Denmark and Canada which both have a Royal Anthem and a State anthem.",
      "Another native bird of New Zealand (the Moa) was one of the largest birds in history – standing up to 3.6m (12 foot) tall and weighing 300kg. Unfortunately they were hunted to extinction by the Maoris by the end of the 1500s.",
      "When the Europeans arrived in New Zealand, it was already inhabited by the Maori people – Eastern polynesian settlers who arrived some time between 800 and 1300. Oral tradition says that they came from a place named Hawaiki; its location is unknown. The very strong linguistic connection to Cook Island Maori might suggest that they originated from that region of the Pacific.",
      "Another group of settlers (who most likely came from the same group as the original Maoris) settled on the Chatham Islands. They were called the Morioris and they were pacifists. In 1835, groups of Maoris moved to the Chatham islands and wiped out nearly all of the Morioris – leaving only 100 by 1862. The last full-blooded Moriori (Tommy Solomon) died in 1933.",
      "New Zealand was the first country to have its three top positions of power held simultaneously by women: The Prime Minister (Helen Clark), the Governor General (Dame Silvia Cartwright), and the Chief Justice (Sian Elias). Zealand by a Governor General, who ratifies all laws put before him or her by the elected parliament of New Zealand.",
      "New Zealand has a strong hold on the international trade in sheep meat. There are presently around 9 sheep to every 1 human in New Zealand (the population of New Zealand is 4 million).",
      "Wellington, the Capital City of New Zealand (and home to me!) is the southernmost capital city in the world.",
      "New Zealand was forced out of the ANZUS (Australia, New Zealand, United States) alliance in the 1980s when it outlawed nuclear arms and power.  To this day, there are no nuclear power stations in New Zealand, and a change of law would be required before one could be built.  New Zealand retains its military ties with the United Kingdom.",
      "New Zealand has one of the most liberal media arenas in the world.  Distinctly left wing versus right wing press is not as obvious there as in other nations.",
      "New Zealand is a plastic nation – almost all personal financial transactions are made with a card – credit or otherwise.  Most shops offer EFTPOS (similar to the UK Chip and Pin which appeared two years later) and cash is seen less and less.  It is possible that New Zealand was the first nation to offer this system of payment (if someone can verify that I would appreciate it).  The majority of taxis now allow you to pay without cash through this system.",
      "New Zealand is a fairly liberal nation with homosexual marriage (Civil Union) being legal and prostitution, soliciting, and brothel keeping being legal.  The driving age is 15, the consensual sex age is 16, and the drinking age is 18 (though minors accompanied by adults are allowed alcohol in restaurants).",
      "Lake Taupo (one of New Zealand’s most popular tourist destinations) was the source of the largest known eruption in the world in the last 70 thousand years.  It had a Volcanic Explosivity Index of 8.  It released over 530 cubit kilometers of magma.",
      "New Zealand was the last major landmass to be populated (with the exception of the polar regions).",
      "New Zealander and Nobel Prize Winner, Ernest Rutherford is known as the father of nuclear physics for his orbital theory of the atom.",
      "Sir Edmund Hillary – the first man to reach the peak of Mount Everest was a New Zealander (born in Auckland) and his face is on the New Zealand $5 bill."
    ]
    msg.send msg.random quotes
