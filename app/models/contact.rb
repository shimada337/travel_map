class Contact < ApplicationRecord
  
  enum subject: {
    投稿内容について: 0, ユーザーについて: 1, その他: 2
  }
end
