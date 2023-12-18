class QuestionsController < ApplicationController
    def ask
    end

    def coach_answer(your_message)
        if your_message.strip[-1] == "?"
            @answer = "Silly question, get dressed and go to work!"
        elsif your_message != "I am going to work"
            @answer = "I don't care, get dressed and go to work!"
        else
            @answer = "Great!"
        end
    end

    def answer
        if params[:question]
            @question = params[:question]
        end
        coach_answer(@question)
    end
end
