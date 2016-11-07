//
//  ZZAllCommentController.swift
//  什么值得买
//
//  Created by Wang_ruzhou on 2016/11/3.
//  Copyright © 2016年 Wang_ruzhou. All rights reserved.
//

import UIKit

class ZZAllCommentController: ZZSecondTableViewController {

    var offset: Int = 0
    var articleID: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "所有评论"

        
        tableView.mj_header.beginRefreshing()
    }
    
    
    func configureParameters() -> NSMutableDictionary{
        let parameters = NSMutableDictionary()
        parameters.setObject("20", forKey: "limit" as NSCopying)
        parameters.setObject(String(offset), forKey: "offset" as NSCopying)
        parameters.setObject("0", forKey: "atta" as NSCopying)
        parameters.setObject("new", forKey: "cate" as NSCopying)
        parameters.setObject("faxian", forKey: "type" as NSCopying)
        parameters.setObject("1", forKey: "get_total" as NSCopying)
        parameters.setObject("1", forKey: "ishot" as NSCopying)
        parameters.setObject("0", forKey: "smiles" as NSCopying)
        parameters.setObject(articleID!, forKey: "article_id" as NSCopying)
        return parameters
    }

}

extension ZZAllCommentController{
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataSource.count
    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        return nil
//    }
}

extension ZZAllCommentController{
    
    override func loadData() {

        //        https://api.smzdm.com/v1/comments?article_id=6520669&atta=0&cate=new&f=iphone&get_total=1&ishot=1&limit=20&offset=0&smiles=0&type=faxian&v=7.3.3&weixin=1
        ZZNetworking.get("v1/comments", parameters: configureParameters()) { (responseObj, error) in
            
            if let _ = error{
                self.tableView.mj_header.endRefreshing()
                return
            }
            
            if let responseObj = responseObj as? [AnyHashable : Any]{
    
                if let hotComments = responseObj["hot_comments"] as? [[AnyHashable : Any]]{
                    
                    self.handleCommentLayouts(commentDicts: hotComments)
                }
                
                if let rows = responseObj["rows"] as? [[AnyHashable : Any]]{
            
                    self.handleCommentLayouts(commentDicts: rows)
                }
            }
            
        }
    }
    
    func handleCommentLayouts(commentDicts: [[AnyHashable : Any]]) {
        
        for commentDict in commentDicts {
            
            if let commentModel = ZZCommentModel.model(with: commentDict) {
                
                let commentLayout = ZZAllCommentLayout.init(commentModel: commentModel)
                
                self.dataSource.add(commentLayout)
                
            }
            
        }
        
    }
    
}

