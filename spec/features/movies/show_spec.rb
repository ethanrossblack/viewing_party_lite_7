require 'rails_helper'

describe "Movie Details Page", type: :feature do
  before do
    VCR.use_cassette("godfather-movie-details") do
      @user = create(:user)
      @movie = MoviesFacade.new(238, nil).movie_details
      visit user_movie_path(@user, 238)
    end
  end
  
  it "has a button to return to the discover page" do
    expect(page).to have_button("Discover Page").once

    click_button("Discover Page")

    expect(current_path).to eq(user_discover_path(@user))
  end

  it "has a button to create a viewing party" do
    expect(page).to have_button("create-viewing-party").once

    click_button("create-viewing-party")

    expect(current_path).to eq("/users/#{@user.id}/movies/#{@movie.id}/viewing_party/new")
  end

  it "shows basic information about the movie" do
    within("#movie-title") do
      expect(page).to have_content(@movie.title)
    end

    within("#movie-rating") do
      expect(page).to have_content(@movie.rating.round(1))
    end
 
    within("#movie-runtime") do
      expect(page).to have_content(@movie.runtime_formatted)
    end

    within("#movie-genre") do
      expect(page).to have_content(@movie.genres.join(", "))
    end

    within("#movie-summary") do
      expect(page).to have_content(@movie.overview)
    end
  end

  it "lists the first 10 cast members" do
    within("#movie-cast") do
      expect(page).to have_css(".cast-member").at_least(1).times
      expect(page).to have_css(".cast-member").at_most(10).times
    end
  end

  it "shows the count of total reviews" do
    within("#movie-reviews-count") do
      # Refactor in future iteration
      expect(page).to have_content(@movie.reviews.count)
    end
  end

  it "shows information for every review" do
    within("#movie-reviews") do
      expect(page).to have_css(".movie-review", count: @movie.reviews.count)

      if @movie.reviews.count > 0
        review1 = @movie.reviews.first
        find_review1 = page.first(".movie-review")

        within(find_review1) do
          expect(page).to have_content("The Godfather Review by Al Carlson")
          within(".review-author") do
            expect(page).to have_content(review1.author)
          end
        end
      end
    end
  end
end