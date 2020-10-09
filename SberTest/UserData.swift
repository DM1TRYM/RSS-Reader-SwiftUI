////
////  SourceListView.swift
////  rss
////
////  Created by 谷雷雷 on 2020/6/23.
////  Copyright © 2020 acumen. All rights reserved.
////
//
//import SwiftUI
//
//struct RSSListView: View {
//
//	enum FeaureItem {
//		case setting
//		case add
//	}
//
//	@ObservedObject var viewModel: RSSListViewModel
//
//	@State private var isAddFormPresented = false
//	@State private var isSettingPresented = false
//	@State private var isSheetPresented = false
//	@State var sources: [RSS] = []
//
//	private var addSourceButton: some View {
//		Button(action: {
//			self.isSheetPresented = true
//		}) {
//			Image(systemName: "plus.circle")
//				.imageScale(.medium)
//		}
//	}
//
//	private var trailingView: some View {
//		HStack(alignment: .top, spacing: 24) {
//			settingButton
//			addSourceButton
//		}
//	}
//
//	var body: some View {
//		NavigationView {
//			List {
//				ForEach(viewModel.items, id: \.self) { rss in
//					NavigationLink(destination: self.destinationView(rss)) {
//						RSSRow(rss: rss)
//					}
//					.tag("RSS")
//				}
//				.onDelete { indexSet in
//					if let index = indexSet.first {
//						self.viewModel.delete(at: index)
//					}
//				}
//			}
//			.navigationBarTitle("RSS")
//			.navigationBarItems(trailing: trailingView)
//		}
//		.sheet(isPresented: $isSheetPresented, content: {
//			if FeaureItem.add == self.selectedFeatureItem {
//				AddRSSView(
//					viewModel: AddRSSViewModel(dataSource: DataSourceService.current.rss),
//					onDoneAction: self.onDoneAction)
//			} else if FeaureItem.setting == self.selectedFeatureItem {
//				SettingView()
//			}
//		})
//		.onAppear {
//			self.viewModel.fecthResults()
//		}
//	}
//}
//
//extension RSSListView {
//
//	func onDoneAction() {
//		self.viewModel.fecthResults()
//	}
//
//	private func destinationView(_ rss: RSS) -> some View {
//		RSSFeedListView(viewModel: RSSFeedViewModel(rss: rss, dataSource: DataSourceService.current.rssItem))
//			.environmentObject(DataSourceService.current.rss)
//	}
//
//}
//
//struct RSSListView_Previews: PreviewProvider {
//	static let viewModel = RSSListViewModel(dataSource: DataSourceService.current.rss)
//
//	static var previews: some View {
//		RSSListView(viewModel: self.viewModel)
//	}
//}
