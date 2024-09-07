class Generation < ActiveHash::Base
  self.data = [
    { id: 1, name: '指定しない' },
    { id: 2, name: '18~25歳' },
    { id: 3, name: '26~30歳' },
    { id: 4, name: '31~35歳' },
    { id: 5, name: '35~40歳' },
    { id: 6, name: '40歳以上' }
  ]
end

