albums = Album.create([
  {
    name: 'Rage Against The Machine',
    image_url: 'https://upload.wikimedia.org/wikipedia/pt/2/2a/RageAgainstTheMachine.jpg',
  },
  {
    name: 'End of Suffering',
    image_url: 'https://upload.wikimedia.org/wikipedia/en/3/36/End_of_Suffering.jpg',
  },
])

reviews = Review.create([
  {
    title: 'Only rage!',
    description: 'I feel so good on listen it',
    score: 5,
    album: albums.first
  },
  {
    title: 'Rage is your only god!',
    description: 'Miss more whammy',
    score: 4,
    album: albums.first
  },
])