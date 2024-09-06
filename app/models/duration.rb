class Duration < ActiveHash::Base
  self.data = [
    { id: 1, name: '30分' },
    { id: 2, name: '1時間' },
    { id: 3, name: '2時間' },
    { id: 4, name: '3時間' },
    { id: 5, name: '3~5時間' },
    { id: 6, name: '5~8時間' }
  ]
  end