# frozen_string_literal: true

class AdminPolicy < ApplicationPolicy
  class Scope < Scope
    def index?
      true
    end
  end
end
