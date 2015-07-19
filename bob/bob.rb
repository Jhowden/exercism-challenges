class Bob
  QUESTION = /\?$/
  END_PUNCTUATION = /(\.|\?|!)$/
  EMPTY_STRING = ""

	def hey( phrase )
    normalized = normalize_phrase( phrase )

    if silence? normalized
      "Fine. Be that way!"
    elsif defuse_yelling? normalized
      "Woah, chill out!"
    elsif answering_question? normalized
      "Sure."
    else
      "Whatever."
    end
  end

  private

  def silence?( phrase )
    phrase.empty?
  end

  def answering_question? phrase
    phrase.match( QUESTION )
  end

  def defuse_yelling? phrase
    updated_phrase = remove_digits_and_end_punctuation phrase
    updated_phrase == updated_phrase.upcase && !updated_phrase.empty?
  end

  def normalize_phrase( phrase )
    phrase = remove_spaces( phrase )
    phrase = remove_commas( phrase )
    phrase = remove_dashes( phrase )
    phrase = remove_newlines( phrase )
    phrase
  end

  def remove_digits_and_end_punctuation( phrase )
    phrase = remove_digits phrase
    phrase = remove_end_punctuation phrase
  end

  def remove_spaces( phrase )
    phrase.gsub( " ", EMPTY_STRING )
  end

  def remove_commas( phrase )
    phrase.gsub( ",", EMPTY_STRING )
  end

  def remove_dashes( phrase )
    phrase.gsub( "-", EMPTY_STRING )
  end

  def remove_apostrophes( phrase )
    phrase.gsub( "'", EMPTY_STRING )
  end

  def remove_newlines( phrase )
    phrase.gsub( "\n", EMPTY_STRING )
  end

  def remove_digits( phrase )
    phrase.gsub( /\d/, "" )
  end

  def remove_end_punctuation( phrase )
    phrase.gsub( END_PUNCTUATION, "" )
  end
end