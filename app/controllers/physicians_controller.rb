class PhysiciansController < ApplicationController

	def index
		# @physicians = Physician.all
		@physicians = Physician.joins(:us_phys_rels).where("user_id = ?", current_user.id)
	end

	def show
		@physician = Physician.find(params[:id])
	end

	def new
		@physician = Physician.new
	end

	def edit
		@physician = Physician.find(params[:id])
	end

	def create
		@physician = Physician.new(physician_params)

		if @physician.save
			@us_phys_rel = UsPhysRel.new user_id: current_user.id, physician_id: @physician.id
			@us_phys_rel.save
			redirect_to @physician
		else
			render 'new'
		end
	end

	def update
		@physician = Physician.find(params[:id])

		if @physician.update(physician_params)
			redirect_to @physician
		else
			render 'edit'
		end
	end

	def destroy
		@physician = Physician.find(params[:id])
		@physician.destroy

		redirect_to physicians_path
	end

	private
		def physician_params
			params.require(:physician).permit(:name)
		end

end
