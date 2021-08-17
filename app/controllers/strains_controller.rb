class StrainsController < ApplicationController
    def index   
        if params[:grower_id]
          grower = Grower.find(params[:grower_id])
          @strains = grower.strains 
        
        else 
          @strains = Strain.order_by_rating.includes(:grower) 
        end 
    end

    def show 
        @strain = Strain.find_by(id: params[:id])
        @grower = @strain.growers.build(user_id:current_user.id)
    end

    def new 
        @strain = Strain.new  
        @strain.build_grower 
    end 

    def create
        @strain = Strain.new(strain_params) 
        @strain.user_id = session[:user_id] 
   
       if @strain.save 
         redirect_to strain_path(@strain) 
       else
        @strain.build_grower  
         render :new 
       end
    end
    
    def edit 
        if authorized_to_edit?(@strain) 
         render :edit   
        else 
         redirect_to strain_path(@strain)   
        end
    end 
  
    def update   
        if @strain.update(strain_params)
          redirect_to strain_path(@strain)
        else
          render :edit
        end 
    end 

    private 

    def strain_params
        params.require(:strain).permit(:name, :category, :thc, :cbd, :grower_id, grower_attributes: [:name])
    end



end
