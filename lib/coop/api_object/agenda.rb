module Coop
  class Agenda < APIObject
    # Public: Get the group's global agenda
    #
    # Examples
    #
    #   Agenda.new({ group_id: 12345 }).global
    #   # => #<Coop::APIObject>
    #
    # Returns APIObject with the agenda data
    def global
      Coop.get_parsed("/groups/#{self.group_id}/agenda")
    end
    
    # Public: Get the group's agendas for all users
    #
    # Examples
    #
    #   Agenda.new({ group_id: 12345 }).users
    #   # => #<Coop::APIObject>
    #
    # Returns APIObject with the agenda data
    def users
      Coop.get_parsed("/groups/#{self.group_id}/user_agendas")
    end
    
    # Public: Get the group's global agenda
    #
    # Examples
    #
    #   Agenda.new({ group_id: 12345 }).user
    #   # => #<Coop::APIObject>
    #
    # Returns APIObject with the agenda data
    def user
      Coop.get_parsed("/groups/#{self.group_id}/my_agenda")
    end
  end
end