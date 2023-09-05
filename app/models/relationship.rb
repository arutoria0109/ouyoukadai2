class Relationship < ApplicationRecord

     belongs_to :follower, class_name: "User"
     belongs_to :followed, class_name: "User"


end















    #followerテーブルとfollowedテーブルを探しに行ってしまうため
    #class_name: "User"でuserテーブルからデータを回収する