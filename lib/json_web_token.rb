class JsonWebToken
  def self.encode(payload)
    JWT.encode(payload, ENV["JWT_KEY"], "HS256")
  end
end
