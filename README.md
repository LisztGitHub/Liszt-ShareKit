# Liszt-ShareKit
###很不错的分享组件,扩展性高,可用性强
<img src = "https://github.com/LisztGitHub/Liszt-ShareKit/blob/master/Liszt-ShareImg.gif">
#
##Exmaple
    
    if(sender.tag==0){
        /*中间弹出*/
        [LisztShareKit addShareItems:self.datas shareKitShowModel:ShareKitShowCenter columnNumber:3 shareDidSelectBlock:^(LisztShareItem *shareItem) {
            [[[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:@"“LisztShareKit”想要分享到%@",shareItem.shareTitle] message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"知道了", nil] show];
        }];
    }
    else if(sender.tag==1){
        /*底部弹出*/
        [LisztShareKit addShareItems:self.datas shareKitShowModel:ShareKitShowBottom columnNumber:3 shareDidSelectBlock:^(LisztShareItem *shareItem) {
            [[[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:@"“LisztShareKit”想要分享到%@",shareItem.shareTitle] message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"知道了", nil] show];
        }];
    }
    else if (sender.tag==2){
        /*只显示标题*/
        [LisztShareKit addShareItems:self.datasTitle shareKitShowModel:ShareKitShowBottom columnNumber:3 shareDidSelectBlock:^(LisztShareItem *shareItem) {
            [[[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:@"“LisztShareKit”想要分享到%@",shareItem.shareTitle] message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"知道了", nil] show];
        }];
    }
    else if (sender.tag==3){
        /*只显示图片*/
        [LisztShareKit addShareItems:self.datasImage shareKitShowModel:ShareKitShowBottom columnNumber:3 shareDidSelectBlock:^(LisztShareItem *shareItem) {
            [[[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:@"“LisztShareKit”想要分享到%@",shareItem.shareTitle] message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"知道了", nil] show];
        }];
    }
    else if (sender.tag==4){
        /*自定义字体和字体颜色*/
        [LisztShareKit addShareItems:self.datasCustomFont shareKitShowModel:ShareKitShowBottom columnNumber:3 shareDidSelectBlock:^(LisztShareItem *shareItem) {
            [[[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:@"“LisztShareKit”想要分享到%@",shareItem.shareTitle] message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"知道了", nil] show];
        }];
    }
    else if(sender.tag==5){
        /*自定义列数*/
        [LisztShareKit addShareItems:self.datas shareKitShowModel:ShareKitShowBottom columnNumber:5 shareDidSelectBlock:^(LisztShareItem *shareItem) {
            [[[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:@"“LisztShareKit”想要分享到%@",shareItem.shareTitle] message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"知道了", nil] show];
        }];
    }
    
###DataSource
      - (NSArray *)datas{
    return @[
             [LisztShareItem itemShareTitle:@"QQ" iconName:@"liszt_share_qq_icon.png" showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:@"QQ空间" iconName:@"liszt_share_qqqone_icon.png" showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:@"微信" iconName:@"liszt_share_wechat_icon.png" showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:@"朋友圈" iconName:@"liszt_share_friends_icon.png" showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:@"微博" iconName:@"liszt_share_sina_icon.png" showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:@"云" iconName:@"liszt_share_cloud_icon.png" showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:@"豆瓣" iconName:@"liszt_share_douban_icon.png" showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:@"蓝牙" iconName:@"liszt_share_lanya_icon.png" showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:@"保存" iconName:@"liszt_share_save_icon.png" showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:@"faceBook" iconName:@"liszt_share_facebook_icon.png" showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:@"twitter" iconName:@"liszt_share_twitter_icon.png" showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]]
             ];
      }
        - (NSArray *)datasTitle{
    return @[
             [LisztShareItem itemShareTitle:@"QQ" iconName:nil showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:@"QQ空间" iconName:nil showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:@"微信" iconName:nil showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:@"朋友圈" iconName:nil showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:@"微博" iconName:nil showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:@"云" iconName:nil showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:@"豆瓣" iconName:nil showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:@"蓝牙" iconName:nil showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:@"保存" iconName:nil showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:@"faceBook" iconName:nil showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:@"twitter" iconName:nil showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]]
             ];
      }
      - (NSArray *)datasImage{
    return @[
             [LisztShareItem itemShareTitle:nil iconName:@"liszt_share_qq_icon.png" showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:nil iconName:@"liszt_share_qqqone_icon.png" showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:nil iconName:@"liszt_share_wechat_icon.png" showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:nil iconName:@"liszt_share_friends_icon.png" showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:nil iconName:@"liszt_share_sina_icon.png" showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:nil iconName:@"liszt_share_cloud_icon.png" showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:nil iconName:@"liszt_share_douban_icon.png" showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:nil iconName:@"liszt_share_lanya_icon.png" showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:nil iconName:@"liszt_share_save_icon.png" showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:nil iconName:@"liszt_share_facebook_icon.png" showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:nil iconName:@"liszt_share_twitter_icon.png" showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]]
             ];
      }
      - (NSArray *)datasCustomFont{
    return @[
             [LisztShareItem itemShareTitle:@"QQ" iconName:@"liszt_share_qq_icon.png" showModel:ShareItemShowNone titleColor:[UIColor redColor] font:[UIFont systemFontOfSize:18]],
             [LisztShareItem itemShareTitle:@"QQ空间" iconName:@"liszt_share_qqqone_icon.png" showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:@"微信" iconName:@"liszt_share_wechat_icon.png" showModel:ShareItemShowNone titleColor:[UIColor cyanColor] font:[UIFont systemFontOfSize:16]],
             [LisztShareItem itemShareTitle:@"朋友圈" iconName:@"liszt_share_friends_icon.png" showModel:ShareItemShowNone titleColor:[UIColor yellowColor] font:[UIFont systemFontOfSize:13]],
             [LisztShareItem itemShareTitle:@"微博" iconName:@"liszt_share_sina_icon.png" showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:@"云" iconName:@"liszt_share_cloud_icon.png" showModel:ShareItemShowNone titleColor:[UIColor yellowColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:@"豆瓣" iconName:@"liszt_share_douban_icon.png" showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:16]],
             [LisztShareItem itemShareTitle:@"蓝牙" iconName:@"liszt_share_lanya_icon.png" showModel:ShareItemShowNone titleColor:[UIColor blueColor] font:[UIFont systemFontOfSize:14]],
             [LisztShareItem itemShareTitle:@"保存" iconName:@"liszt_share_save_icon.png" showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:18]],
             [LisztShareItem itemShareTitle:@"faceBook" iconName:@"liszt_share_facebook_icon.png" showModel:ShareItemShowNone titleColor:[UIColor blackColor] font:[UIFont systemFontOfSize:15]],
             [LisztShareItem itemShareTitle:@"twitter" iconName:@"liszt_share_twitter_icon.png" showModel:ShareItemShowNone titleColor:[UIColor magentaColor] font:[UIFont systemFontOfSize:13]]
             ];
      }        
      

