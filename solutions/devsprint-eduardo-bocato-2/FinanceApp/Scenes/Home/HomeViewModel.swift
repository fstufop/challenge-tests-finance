import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func didFetchHomeData(_ data: HomeData)
}

struct HomeViewModel {
    weak var delegate: HomeViewModelDelegate?
    
    private let homeService: HomeServiceProtocol.Type
    
    init(homeService: HomeServiceProtocol.Type = FinanceService.self) {
        self.homeService = homeService
    }

    private let service: FinanceServiceProtocol

    init(with service: FinanceServiceProtocol) {
        self.service = service
    }

    func fetchData() {
        homeService.fetchHomeData { homeData in
            guard let homeData = homeData else { return }
            self.delegate?.didFetchHomeData(homeData)
        }
    }
}
