//
//  ProjectsView.swift
//  UltimatePortfolio
//
//  Created by Ray on 1/9/21.
//

import SwiftUI

struct ProjectsView: View {
    let showClosedProjects: Bool
    static let openTag: String? = "Open"
    static let closedTag: String? = "Closed"

    let projects: FetchRequest<Project>

    init(showClosedProjects: Bool) {
        self.showClosedProjects = showClosedProjects

        projects = FetchRequest<Project>(entity: Project.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Project.creationDate, ascending: false)
        ], predicate: NSPredicate(format: "closed = %d", showClosedProjects))
    }

    var body: some View {
        // Pretty cool view
        NavigationView {
            List {
                ForEach(projects.wrappedValue) { project in
                    Section(header: ProjectHeaderView(project: project) ) {
                        ForEach(project.projectItems) { item in
                            ItemRowView(item: item)
                        }
                    }
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle(showClosedProjects ? "Closed Projects" : "Open Projects")
    }
}

struct ProjectsView_Previews: PreviewProvider {
    static var dataController = DataController.preview

    static var previews: some View {
        ProjectsView(showClosedProjects: false)
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
    }
}
