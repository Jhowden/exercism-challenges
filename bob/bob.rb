class Bob
  QUESTION = /\?$/
  END_PUNCTUATION = /(\.|\?|!)$/

	def hey( phrase )
    normalized = normalize_phrase( phrase )

    if normalized.empty?
      "Fine. Be that way!"
    elsif defuse_yelling? normalized
      "Woah, chill out!"
    elsif answering_question? normalized
      "Sure."
    else
      "Whatever."
    end
  end

  def answering_question? phrase
    phrase.match( QUESTION )
  end

  def defuse_yelling? phrase
    delete_numbers_phrase = phrase.gsub( /\d/, "" ).
      gsub( END_PUNCTUATION, "" )
    delete_numbers_phrase == delete_numbers_phrase.upcase && !delete_numbers_phrase.empty?
  end

  def normalize_phrase( phrase )
    phrase.gsub( " ", "" ).gsub( ",", "" ).gsub( "-", "" ).gsub( "'", "" ).gsub( "\n", "||" )
  end
end