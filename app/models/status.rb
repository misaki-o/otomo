class Status < ActiveHash::Base
 self.data = [
   { id: 1, name: '募集中！' },
   { id: 2, name: '募集〆切' },
   { id: 3, name: '開催終了' }
 ]
end