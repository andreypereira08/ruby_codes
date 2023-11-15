def coach_answer(your_message)
  # TODO: return coach answer to your_message
  if your_message.strip[-1] == "?"
    return "Silly question, get dressed and go to work!"
  else
    return "I don't care, get dressed and go to work!"
  end
end

def coach_answer_enhanced(your_message)
  # TODO: return coach answer to your_message, with additional custom rules of yours!
  if your_message == your_message.upcase
    return "I can feel your motivation!"
  else
    return coach_answer(your_message)
  end
end
