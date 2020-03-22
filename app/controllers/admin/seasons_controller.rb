class Admin::SeasonsController < Admin::BaseController
  def show
    @season = Season.find(params[:id])

    respond_to do |format|
      format.html { redirect_to admin_season_path(@season.id, format: :csv) }
      format.csv { send_data Match.export_summary, filename: "season-#{@season.name.parameterize}-export-#{Time.now.in_time_zone('America/Chicago').strftime('%Y%m%d')}.csv" }
    end
  end
end
