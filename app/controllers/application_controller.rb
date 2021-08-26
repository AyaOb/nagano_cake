class ApplicationController < ActionController::Base
  
  POSTAGE = 800
  
  def after_sign_in_path_for(resource)
    if admin_signed_in?
      # 管理者トップページ（注文履歴一覧）
      admin_path
    else
     # 会員ログイン後、トップページ
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :admin
    # 管理者ログイン画面
      new_admin_session_path
    else
      root_path
    end
  end
end
