class BasicController < ApplicationController
  before_action :authenticate_user!
  before_action :check_opened, :only => [:level1, :level2, :level3, :level4, :level5]

  def index
    @basic_outlines = Basic.attributes
  end

  def level1
    @ranked_players = Array.new
    Record.all.where(cate: 'b1').order(solved: :desc, finish_time: :asc).includes(:user => :record).each do |r|
      if r.user.id != 1
        @ranked_players << r.user
      end
    end
    @url = Basic.url(1).first.url
    @chal = Basic.find_by_id(1)
    @hint = Hint.hint('b1').empty? ? "Empty here!" : Hint.hint('b1').first.hint
    @user = current_user
    @userpass = user_params[:flag]
    @pass = Digest::SHA1.hexdigest(Basic.flag(1).first.flag)
    if !@userpass.nil?
      @userpass = Digest::SHA1.hexdigest @userpass
      @user.record.find_by_cate('b1').update(last_try_time: DateTime.current)
      if @userpass == @pass
        @user.last_submit_time = @user.record.find_by_cate('b1').last_try_time
        if !@user.record.find_by_cate('b1').solved
          @user.score += 10
          @user.record.find_by_cate('b1').update(solved: true, score: @user.score)
          if @user.save
            flash[:alert] = 'Congratulations!'
            @user.record.find_by_cate('b1').update(finish_time: @user.last_submit_time)
            redirect_to wargame_basic_path
          else
            render 'basic/level1'
          end
        else
          flash[:alert] = 'You\'ve passed the problem!'
          redirect_to wargame_basic_path
        end
      else
        flash[:alert] = 'Failed! Maybe try again?'
        render 'basic/level1'
      end
    end
  end

  def level2
    @ranked_players = Array.new
    Record.all.where(cate: 'b2').order(solved: :desc, finish_time: :asc).includes(:user => :record).each do |r|
      if r.user.id != 1
        @ranked_players << r.user
      end
    end
    @url = Basic.url(2).first.url
    @chal = Basic.find_by_id(2)
    @hint = Hint.hint('b2').empty? ? "Empty here!" : Hint.hint('b2').first.hint
    @user = current_user
    @userpass = user_params[:flag]
    @pass = Digest::SHA1.hexdigest(Basic.flag(2).first.flag)
    if !@userpass.nil?
      @userpass = Digest::SHA1.hexdigest @userpass
      @user.record.find_by_cate('b2').update(last_try_time: DateTime.current)
      if @userpass == @pass
        @user.last_submit_time = @user.record.find_by_cate('b2').last_try_time
        if !@user.record.find_by_cate('b2').solved
          @user.score += 20
          @user.record.find_by_cate('b2').update(solved: true, score: @user.score)
          if @user.save
            flash[:alert] = 'Congratulations!'
            @user.record.find_by_cate('b2').update(finish_time: @user.last_submit_time)
            redirect_to wargame_basic_path
          else
            render 'basic/level2'
          end
        else
          flash[:alert] = 'You\'ve passed the problem!'
          redirect_to wargame_basic_path
        end
      else
        flash[:alert] = 'Failed! Maybe try again?'
        render 'basic/level2'
      end
    end
  end

  def level3
    @ranked_players = Array.new
    Record.all.where(cate: 'b3').order(solved: :desc, finish_time: :asc).includes(:user => :record).each do |r|
      if r.user.id != 1
        @ranked_players << r.user
      end
    end
    @url = Basic.url(3).first.url
    @chal = Basic.find_by_id(3)
    @hint = Hint.hint('b3').empty? ? "Empty here!" : Hint.hint('b3').first.hint
    @user = current_user
    @userpass = user_params[:flag]
    @pass = Digest::SHA1.hexdigest(Basic.flag(3).first.flag)
    if !@userpass.nil?
      @userpass = Digest::SHA1.hexdigest @userpass
      @user.record.find_by_cate('b3').update(last_try_time: DateTime.current)
      if @userpass == @pass
        @user.last_submit_time = @user.record.find_by_cate('b3').last_try_time
        if !@user.record.find_by_cate('b3').solved
          @user.score += 30
          @user.record.find_by_cate('b3').update(solved: true, score: @user.score)
          if @user.save
            flash[:alert] = 'Congratulations!'
            @user.record.find_by_cate('b3').update(finish_time: @user.last_submit_time)
            redirect_to wargame_basic_path
          else
            render 'basic/level3'
          end
        else
          flash[:alert] = 'You\'ve passed the problem!'
          redirect_to wargame_basic_path
        end
      else
        flash[:alert] = 'Failed! Maybe try again?'
        render 'basic/level3'
      end
    end
  end

  def level4
    @ranked_players = Array.new
    Record.all.where(cate: 'b4').order(solved: :desc, finish_time: :asc).includes(:user => :record).each do |r|
      if r.user.id != 1
        @ranked_players << r.user
      end
    end
    @url = Basic.url(4).first.url
    @chal = Basic.find_by_id(4)
    @hint = Hint.hint('b4').empty? ? "Empty here!" : Hint.hint('b4').first.hint
    @user = current_user
    @userpass = user_params[:flag]
    @pass = Digest::SHA1.hexdigest(Basic.flag(4).first.flag)
    if !@userpass.nil?
      @userpass = Digest::SHA1.hexdigest @userpass
      @user.record.find_by_cate('b4').update(last_try_time: DateTime.current)
      if @userpass == @pass
        @user.last_submit_time = @user.record.find_by_cate('b4').last_try_time
        if !@user.record.find_by_cate('b4').solved
          @user.score += 40
          @user.record.find_by_cate('b4').update(solved: true, score: @user.score)
          if @user.save
            flash[:alert] = 'Congratulations!'
            @user.record.find_by_cate('b4').update(finish_time: @user.last_submit_time)
            redirect_to wargame_basic_path
          else
            render 'basic/level4'
          end
        else
          flash[:alert] = 'You\'ve passed the problem!'
          redirect_to wargame_basic_path
        end
      else
        flash[:alert] = 'Failed! Maybe try again?'
        render 'basic/level4'
      end
    end
  end

  def level5
    @ranked_players = Array.new
    Record.all.where(cate: 'b5').order(solved: :desc, finish_time: :asc).includes(:user => :record).each do |r|
      if r.user.id != 1
        @ranked_players << r.user
      end
    end
    @url = Basic.url(5).first.url
    @chal = Basic.find_by_id(5)
    @hint = Hint.hint('b5').empty? ? "Empty here!" : Hint.hint('b5').first.hint
    @user = current_user
    @userpass = user_params[:flag]
    @pass = Digest::SHA1.hexdigest(Basic.flag(5).first.flag)
    if !@userpass.nil?
      @userpass = Digest::SHA1.hexdigest @userpass
      @user.record.find_by_cate('b5').update(last_try_time: DateTime.current)
      if @userpass == @pass
        @user.last_submit_time = @user.record.find_by_cate('b5').last_try_time
        if !@user.record.find_by_cate('b5').solved
          @user.score += 50
          @user.record.find_by_cate('b5').update(solved: true, score: @user.score)
          if @user.save
            flash[:alert] = 'Congratulations!'
            @user.record.find_by_cate('b5').update(finish_time: @user.last_submit_time)
            redirect_to wargame_basic_path
          else
            render 'basic/level5'
          end
        else
          flash[:alert] = 'You\'ve passed the problem!'
          redirect_to wargame_basic_path
        end
      else
        flash[:alert] = 'Failed! Maybe try again?'
        render 'basic/level5'
      end
    end
  end

  def content_save
    @chal = Basic.find_by(:id => params[:basic][:id])
    @chal.content = params[:basic][:content].gsub(/\'/, "&#39;").gsub(/(\r)+\n/, "")
    if !!@chal.save
      respond_to do |format|
        format.js { render partial: "shared/challenge_content_save" }
      end
    end
  end

  def content_edit
    @chal = Basic.find_by(:id => params[:basic][:id])
    respond_to do |format|
      format.js { render partial: "shared/challenge_content_edit" }
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.permit(:flag)
  end

  def check_opened
    @tmp = controller_name.clone
    @tmp[0] = @tmp[0].capitalize
    @flag = @tmp.constantize.opened? action_name[-1]
    if (not current_user.admin?) && (@flag != true)
      flash[:alert] = 'Not yet ready!'
      redirect_to (request.referer or home_path)
    end
  end
end