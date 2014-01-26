JLBlockAlert
============

This is a subclass of the UIAlertView in order to make it implement blocks.

You can use it with blocks or just as a plain UIAlertView using the secondary delegate instance variable.

-Implementation Example-

BlockAlertView* blockAlert = [[BlockAlertView alloc] initWithTitle:@"Block Alert" message:@"This alert uses blocks." delegate:Nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"Submit", nil];
[blockAlert setClickedButtonBlock:^(BlockAlertView *alertView, NSInteger buttonIndex) {
               
  NSLog(@"Clicked Block Fired");
                
}];
[blockAlert show];


