# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movie' do
  before do
    movie_data = {
      genres: [{ id: 18, name: 'Drama' }, { id: 80, name: 'Crime' }],
      id: 238,
      overview: 'Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.',
      runtime: 175,
      title: 'The Godfather',
      vote_average: 8.7,
      reviews: { page: 1,
                 results: [{ author: 'futuretv',
                             content: "The Godfather Review by Al Carlson\r\n\r\nThe Godfather is a film considered by most to be one of the greatest ever made. From The American Film Institute to as voted by users on the Internet Movie Database (IMDB) it is consider to be one of the best. As a film that ranks as high as other masterpieces including Citizen Kane, Pulp Fiction and 12 Angry Men, The Godfather is an exceptional piece of cinema excellence that is flawless and is simply the pinnacle crime drama.\r\nThe Godfather revolves around the Corleone’s, an Italian family with deep roots in the New York City mafia. The head of the Corleone’s is Don Vito Corleone, a man who takes care of his family and demands respect in return. His son Michael however, who just returned home from World War II, doesn’t want to become involved with the family business. The Sollozzo’s, a family of drug dealers, confront Don and request protection in exchange for profits from the Sollozzo’s drug sales. But Don declines the offer, for he is against selling narcotics. The rejected offer starts what turns into an all out mafia war between the two families with Michael diving deep into the mafia lifestyle.\r\nThe characters are portrayed by a legendary all-star cast including Marlon Brando as Don, Al Pacino as his son Michael and James Caan as Don’s oldest son Sonny. The casting for this film has been considered by many to be the best casted film in history for their astonishing performances. All three main actors were nominated for an academy award, but only Marlon Brando won an Oscar for best actor in a leading role. It’s fascinating to watch how these characters change over the course of the movie, with one in particular changing drastically.\r\nDirecter Francis Ford Coppola, being raised in an Italian-American family in New York, understood Italian culture exceptionally and made the film very authentically. Everything from the wedding dances to the cuisine to the terms used by the characters in Sicilian come from Coppola’s first-hand knowledge of Italian-American culture. Italian composer Nino Rota did an outstanding job making the soundtrack for the film, despite not getting the Oscar for best music (but he did win an Oscar for his work in the sequel, The Godfather: Part II). Virtually everyone recognizes that iconic trumpet solo once it starts playing. He also wrote the score for another great Italian film 8 1/2. \r\nThis film should be immediately followed up by it’s sequel, The Godfather: Part II, which also won best picture. The series still holds the title of most best picture awards for a film series to this day. They’re both flawless crime dramas and have earned their titles as some of the best pieces of cinema ever. I will guarantee you won’t be able to see this film only once, as it gets better after continual viewings. There is really nothing more to add other than if you haven’t seen this movie yet, it’s about time you did. The Godfather is a movie you can’t refuse." },
                           { author: 'crastana',
                             content: "The best movie ever...\r\nA masterpiece by the young and talented Francis Ford Coppola, about a Mob family and their drama, the story telling is perfect, the acting good, sometimes a little over the top in the case of Thalia Shire (the sister of the director)\r\n\r\nThe 70's were the best years for Hollywood." },
                           { author: 'drystyx',
                             content: "While I'm writing this, The Godfather is still beloved by people who love it simply because they are told they have to love it. \r\nIt's written by a mobster with the sole intention of depicting the lead mobsters as demi gods. Every line and every scene in the movie and the book is meant to intimidate people into thinking the \"Mafia\" and really any mob, is a supernatural force.\r\nThis is a movie glorifying control freaks, and most critics are control freaks, and most critics are either in the mob or think they can join the mob.\r\nThe movie itself is dull and totally uninspiring, not to mention totally uninspired. For fifty years, the sheep have been cowing to the control freaks who tell them to love this movie that degrades them. \r\nThere just isn't anything favorable about this movie. It owes its success to people who have interests in the movie or think they can get brownie points with such people. It's totally Hollywood in its depressing nature, and even in the seventies it was a formula film.",
                             created_at: '2023-04-02T03:49:51.130Z' },
                           { author: 'CinemaSerf',
                             content: "When you get a story written quite this magnificently it would take an extreme amateur to screw it up - and Francis Ford Coppola is no amateur. Marlon Brando, Al Pacino, James Caan and Robert Duvall represent the epitome of guile, sophistication, loyalty, honour and brutality in this self-adapted Mario Puzo story of the unambiguously ambitious \"Corleone\" family - they start with nothing and so the only way is up; however and whatever they need to do to get there. The characterisations are layered and colourful; Diane Keaton has no idea what she's getting herself into! John Cazale is great as the spineless brother \"Fredo\" too. Once again, Nino Rota pulls out all the stops to give this a score that helps cement this film's place as amongst the best ever made. My only criticism, and it is slight at that, is that the audio mix could have done with a bit of a boost. Much of the dialogue - especially from Brando - verges on the inaudible at times." },
                           { author: 'Suresh Chidurala', content: 'Great Movie **Ever**' }] },
      credits: { cast: [{ name: 'Marlon Brando', character: 'Don Vito Corleone', order: 0 },
                        { name: 'Al Pacino', character: 'Michael Corleone', order: 1 },
                        { name: 'James Caan', character: 'Sonny Corleone', order: 2 },
                        { name: 'Robert Duvall', character: 'Tom Hagen', order: 3 },
                        { name: 'Richard S. Castellano', character: 'Clemenza', order: 4 },
                        { name: 'Diane Keaton', character: 'Kay Adams', order: 5 },
                        { name: 'Talia Shire', character: 'Connie Corleone Rizzi', order: 6 },
                        { name: 'Gianni Russo', character: 'Carlo Rizzi', order: 7 },
                        { name: 'Sterling Hayden', character: 'Captain McCluskey', order: 8 },
                        { name: 'John Marley', character: 'Jack Woltz', order: 9 },
                        { name: 'Richard Conte', character: 'Barzini', order: 10 }] }
    }

    @movie = Movie.new(movie_data)
  end

  it 'exists and has attributes' do
    expect(@movie).to be_a Movie

    expect(@movie.title).to eq('The Godfather')
    expect(@movie.rating).to eq(8.7)
  end

  describe 'instance methods' do
    describe '#cast_list' do
      it 'returns a collection of (up to) the first 10 cast members as CastMember POROs' do
        expect(@movie.cast_list).to be_an Array
        expect(@movie.cast_list.length).to eq(10)
        expect(@movie.cast_list.first).to be_a CastMember
      end
    end

    describe '#reviews' do
      it 'returns a collection of Review POROs' do
        expect(@movie.reviews).to be_an Array
        expect(@movie.reviews.length).to eq(5)
        expect(@movie.reviews.first).to be_a Review
      end
    end

    describe '#runtime_formatted' do
      it "returns a string of the runtime in '$hr $min' syntax" do
        expect(@movie.runtime_formatted).to be_a String
        expect(@movie.runtime_formatted).to eq('2hr 55min')
      end
    end
  end
end
