class PagesController < ApplicationController
  def home
    @annonces = Annonce.all
  end

  def search
    @annonces = Annonce.all
    @selected_annonces = @annonces.where(city: params[:city], prix_metre_carre: (0..params[:prix_metre_carre].to_i).to_a)
  end
end
