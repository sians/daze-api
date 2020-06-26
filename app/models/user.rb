# frozen_string_literal: true

class User < ActiveRecord::Base
  before_create :set_uid
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  include GraphqlDevise::Concerns::Model

  def set_uid
    self.uid = self.email
  end
end
