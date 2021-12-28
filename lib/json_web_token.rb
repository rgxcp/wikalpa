class JsonWebToken
  JWT_KEY = ENV["JWT_KEY"]
  ALGORITHM = "HS256"

  def self.encode(payload)
    JWT.encode(payload, JWT_KEY, ALGORITHM)
  end

  def self.decode(token)
    JWT.decode(token, JWT_KEY, ALGORITHM)
  end
end
