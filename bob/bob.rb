class Bob
  QUESTION_MARK = "?"
  UPPERCASE_LETTERS = /[A-Z]/

	def hey( phrase )
    normalized = remove_spaces( phrase )

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

  def answering_question?( phrase )
    phrase.end_with?( QUESTION_MARK )
  end

  def defuse_yelling?( phrase   )
    phrase == phrase.upcase && phrase.match( UPPERCASE_LETTERS )
  end

  def remove_spaces( phrase )
    phrase.strip
  end
end