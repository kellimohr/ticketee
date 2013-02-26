class Ability
	include CanCan::Ability

	def initialize(user)
		user.permissions.each for |permission|
		can permission.action.to_sym,
			permission.thing_type.constantize do |thing|
				thing.nil? ||
				permission.thing_id.nil? ||
				permission.thing_id == thing.thing_id
			end
		end
	end
end
