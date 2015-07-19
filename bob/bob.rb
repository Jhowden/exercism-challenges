class Bob
  YELLING = /[^a-z]{0}[A-Z]+[^a-z]{0}!$/
  YELLING_NO_EXCLAMATION = /[A-Z]+[^(\.|\?|!)]$/
  SPECIAL_CHARACTERS = /(%|\^|\*|@|#|\$|\()+/
  FORCEFUL_QUESTION = /[^a-z][A-Z]+[^\d?]\?$/

  NUMERIC_QUESTION = /\d+.*\?$/
  QUESTION = /[^A-Z]\?$/
  NUMBERS_ONLY_QUESTION = /\d+\?$/
  PRATTLING_ON = /!.+\..+\?/

	def hey( phrase )
    normalized = normalize_phrase( phrase )
    return "Fine. Be that way!" if normalized.empty?
    return "Woah, chill out!" if defuse_yelling? normalized
    return "Sure." if laidback? normalized
    return "Whatever."
    # case normalized
    # when /[^A-Z]!$/
    #   "Whatever."
    # when /[A-Z]{2,}[a-z]+[A-Z]{2,}/
    #   "Whatever."
    # when /\|\|/
    #   "Whatever."
    # when /\d+/
    #   "Whatever."
    # else 
    #   "Whatever."
    # end
  end

  def laidback? phrase
    [NUMERIC_QUESTION, QUESTION, NUMBERS_ONLY_QUESTION, PRATTLING_ON].any? do |regex|
      phrase.match regex
    end
  end

  def defuse_yelling? phrase
    [YELLING, YELLING_NO_EXCLAMATION, SPECIAL_CHARACTERS, FORCEFUL_QUESTION].any? do |regex|
      phrase.match regex
    end
  end

  def normalize_phrase( phrase )
    phrase.gsub( " ", "" ).gsub( ",", "" ).gsub( "-", "" ).gsub( "'", "" ).gsub( "\n", "||" )
  end
end