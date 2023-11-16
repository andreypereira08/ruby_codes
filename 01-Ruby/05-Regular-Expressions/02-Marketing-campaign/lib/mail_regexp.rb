def valid?(email)
  # TODO: return true if the email is valid, false otherwise
  return email.match?(/\w+@\w+\.[a-z]{1,3}/)
end

def clean_database(emails)
  # TODO: return an array with the valid emails only
  result = []
  emails.each do |email|
    result.push(email) if valid?(email)
  end
  result
end

def group_by_tld(emails)
  # TODO: return a Hash with emails grouped by TLD
  result = {  
    "com" =>	[],
    "de" =>	[],
    "fr" =>	[]
  }

  emails.each do |email|
    if email.match(/\.[a-z]{1,3}/).to_s == ".fr"
      result["fr"].push(email)
    elsif email.match(/\.[a-z]{1,3}/).to_s == ".com"
      result["com"].push(email)
    elsif email.match(/\.[a-z]{1,3}/).to_s == ".de"
      result["de"].push(email)
    end
  end
  return result
end

def compose_mail(email)
  # TODO: return a Hash with username, domain and tld extracted from email
  domain = (email.match(/@[a-z]+\./).to_s).gsub("@", "")
  domain = domain.gsub(".", "")
  username = (email.match(/[a-z]+\b@/).to_s).gsub("@", "")
  tld = email.match(/[a-z]+\z/).to_s
  return {username: username, domain: domain, tld: tld}
end

def compose_translated_email(email)
  # TODO: return a Hash with username, domain and tld extracted from email
  # TODO: translate subject, body, closing and signature, according to TLD

  locales = { #quando a variavel era LOCALES causava erro, provavelmente por fugir do snack_case
    en: {
      subject: "Our website is online",
      body: "Come and visit us!",
      closing: "See you soon",
      signature: "The Team"
    },
    fr: {
      subject: "Notre site est en ligne",
      body: "Venez nous rendre visite !",
      closing: "A bientot",
      signature: "L'équipe"
    },
    de: {
      subject: "Unsere Website ist jetzt online",
      body: "Komm und besuche uns!",
      closing: "Bis bald",
      signature: "Das Team"
    }
  }

  subject = ""
  body = ""
  closing = ""
  signature = ""

  domain = compose_mail(email)[:tld]
  if domain == "com" || domain == "en" #nos testes houve uma confunsão e não tem o domin ou tld com "en"
    subject = locales[:en][:subject]
    body = locales[:en][:body]
    closing = locales[:en][:closing]
    signature = locales[:en][:signature]
  elsif domain == "fr"
    subject = locales[:fr][:subject]
    body = locales[:fr][:body]
    closing = locales[:fr][:closing]
    signature = locales[:fr][:signature]
  elsif domain == "de"
    subject = locales[:de][:subject]
    body = locales[:de][:body]
    closing = locales[:de][:closing]
    signature = locales[:de][:signature]  
  end
  
  before_email = compose_mail(email)
  after_email = {subject: subject, body: body, closing: closing, signature: signature}
  return before_email.merge(after_email)
end