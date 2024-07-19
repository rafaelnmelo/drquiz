import SwiftUI

struct QuizListView: View {
    
    @State private var isActive: Bool = false
    @StateObject private var quizListVM = QuizListViewModel(networkService: NetworkServiceFactory.create())
    @State private var selectedQuiz: QuizViewModel?

    var body: some View {
        
        NavigationView {
            
            List(quizListVM.quizes) { quiz in
               
                NavigationLink(tag: quiz, selection: $selectedQuiz) {
                    QuestionListView(quiz: quiz, quizSubmission: QuizSubmission(quizId: quiz.quizId))
                } label: {
                    Text(quiz.title)
                }

            }
            .accessibilityIdentifier("quizList")
            .onAppear {
                quizListVM.populateAllQuizes()
            }
            .navigationTitle("Quizes")
        }.environment(\.rootPresentationMode, $selectedQuiz)
    }
}

struct QuizListView_Previews: PreviewProvider {
    static var previews: some View {
        QuizListView()
    }
}
