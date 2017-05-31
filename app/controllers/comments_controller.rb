class CommentsController < ApplicationController
   #コメントを保存、投稿するためのアクションです。
   def create
      #Blogをパラメータの値から探し出し、BlogにひもづくcommentsとしてBuildします。
      @comment = current_user.comments.build(comment_params)
      @blog = @comment.blog
      @notification = @comment.notifications.build(user_id: @blog.user.id )
      end

      #クライアントからの要求に応じてレスポンスのフォーマットを変更します。
      respond_to do |format|
         if @comment.save
            format.html { redirect_to blog_path(@blog), notice: 'コメントを投稿しました。'}
            #JS形式でレスポンスを返します。
             format.js { render :index }

             unless @comment.blog.user_id == current_user.id
               Pusher.trigger("user_#{@comment.blog.user_id}_channel", 'comment_created', {
                 message: 'あなたの作成したブログにコメントが付きました'
               })
             end
             Pusher.trigger("user_#{@comment.blog.user_id}_channel", 'notification_created', {
               unread_counts: Notification.where(user_id: @comment.blog.user.id, read: false).count
             })
             else
             format.html  { redirect_to blog_path(@blog), notice: 'コメントを入力してください。'}
         end
       end
    end

   def edit
      @comment = Comment.find(params[:id])
      respond_to do |format|
      format.js { render :edit }
   end
 end

   def destroy
        @comment = Comment.find(params[:id])
        @blog = @comment.blog
        @comment.destroy

      respond_to do |format|
       format.html { redirect_to blog_path(@blog), notice: 'コメントを削除しました！'}
       format.js { render :index }
      end
   end

  private
    #ストロングパラメーター
     def comment_params
         params.require(:comment).permit(:blog_id, :content)
    end
end
