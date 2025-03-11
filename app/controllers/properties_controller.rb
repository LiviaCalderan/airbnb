class PropertiesController < ApplicationController
  def show
    @property = Property.includes(:reviews).find(params[:id])
    @overall_rating_counts = @property
                                .reviews
                                # Arredondamento da coluna p/ inteiro
                                .group("ROUND(final_rating)")
                                # conta quantos registros existem em cada grupo - retorna um hash
                                .count
                                # converte todas as chaves p/ inteiros
                                .transform_keys(&:to_i)
    @overall_rating_counts.default = 0
  end
end
