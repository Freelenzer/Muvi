import SwiftUI


struct MoviesView: View {
  @StateObject private var viewModel = MoviesViewModel(repository: .init())
  
  var body: some View {
    
    NavigationView {
      ScrollView {
        MediaSection(media: viewModel.comingSoonMovies, title: "Coming Soon", redactedViewsNumber: 3, type: .landscape) {
          ForEach(viewModel.comingSoonMovies.prefix(8), id: \.id) { movie in
            ComingSoonCard(media: movie)
          }
        }
        
        MediaSection(media: viewModel.trendingMovies, title: "Trending Now", redactedViewsNumber: 5, type: .portrait) {
          ForEach(viewModel.trendingMovies.prefix(8), id: \.id) { movie in
            MediaCardView(media: movie)
          }
        }
        
        MediaSection(media: viewModel.latestMovies, title: "Latest Releases", redactedViewsNumber: 5, type: .portrait) {
          ForEach(viewModel.latestMovies.prefix(8), id: \.id) { movie in
            MediaCardView(media: movie)
          }
        }
        
        MediaSection(media: viewModel.popularMovies, title: "Hits Box Office", redactedViewsNumber: 5, type: .portrait) {
          ForEach(viewModel.popularMovies.prefix(8), id: \.id) { movie in
            MediaCardView(media: movie)
          }
        }
      }.task {
        do {
          try await viewModel.fetchMovies()
        } catch {
          print(error)
        }
      }.navigationTitle(Text("Movies"))
    }
  }
}


struct MoviesView_Previews: PreviewProvider {
  static var previews: some View {
    MoviesView()
      .preferredColorScheme(.dark)
  }
}