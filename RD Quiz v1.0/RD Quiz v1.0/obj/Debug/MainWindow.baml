   M S B A M L   `   `   `  ����B  >RD Quiz, Version=1.2.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:RD_Quiz_v1._0RD_Quiz_v1._0  5   	       RD_Quiz_v1._0.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   -localclr-namespace:RD_Quiz_v1._0     5   	   -   5          �Name$  
QuizWindow��5   	    � Title$ RD Quiz��5      $	��800��6   $
��1200��6   $��20(�6B   $��SemiBold"�6P    � WindowStartupLocation$ CenterScreen=�6�   ��6,   Z� .��5	      � -   5         �Name$ RD_Quiz��5	       � ColumnDefinitions 5
   
   �� 5      $	��50* �6   �� 5      $
��550* �6   �� 5      $
��600* �6    � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      �� 5      $
��Auto �6   �� 5      $
��Auto �6   ��5   
   �� 5       �� EndPoint$ 0.5,1&�6"    �� 
StartPoint$ 0.5,0&�63   .��5      �  � Color$ 	#FF080704��6   	 � Offset$	 0Q�61   � 5      $ 	#FF1D1B14��6   $	 1Q�61   � 5      $ 	#FF151410��6   $		 0.5Q�61   5      .+�5   
   r� -   5        
 r�Name$
 	vidPlayer��5   O    r� Source$ videos/000_walk_in.mp4?�6    r� LoadedBehavior$ Manual=�67   $	��720��6b   $
��1280��6r   $	��100��6�   $	��100��6�   $
��20,0q�6�   $��3��6�   $��1��6�   ��.  r� UnloadedBehavior$ Manual=�6�   $y�Hidden=�61   J� Effect 5      3  -System.Windows.Media.Effects.DropShadowEffect  5         ShadowDepth$ 10Q�6#      Opacity$	 0.8Q�64      
BlurRadius$ 8Q�6B   5       �� 5!   
   -   5         ��Name$ btnContinue��5!      $��Continue��6&   $��
80,15,0,15q�69   $��3��6M   $��28(�6Z   $��2��6h   $��Center=�6x   $
��Left=�6�   $	��250��6�   $��Center=�6�   
���   � �� 	IsDefault . $
��1,20q�6  ��5"      �� 5#      $	 0,1&�6&   $	 0,0&�65   .��5$      � $ 	#FF977373��6#   $	 0Q�65   � 5%      $ 	#FF7A5E5E��6#   $		 0.5Q�65   � 5&      $ 	#FF3F2121��6#   $	 1Q�65   5'      5)      �� 5*   
   -   5        $ 	btnReplay��5*      $��Replay��6$   $��
0,15,80,15q�65   $��28(�6I   $��Center=�6W   $��Right=�6{   $	��250��6�   $��Center=�6�   
���   �$��3��6�   $��1��6�   $
��1,20q�6  ��5+      �� 5,      $	 0,1&�6&   $	 0,0&�65   .��5-      � $ 	#FFB1B098��6#   $	 0Q�65   � 5.      $ 	#FFA0826B��6#   $		 0.5Q�65   � 5/      $ 	#FF663C3C��6#   $	 1Q�65   50      52      �� 53   
   -   5         ��Name$ lblTitle��53      $��Opening Scene��6"   $��	0,15,0,20q�6:   ���	#FFFFE500$��3��6d   $��32(�6x   $��Center=�6�   $��Center=�6�   �� 54   
   -   5         ��Name$ 	tbCaption��54      $��1��6'   $��	0,20,0,10q�67   
�������$��3��6]   $��28(�6q   $��2��6   $
��Wrap=�6�   $��Caption��6�    �� TextAlignment$ Center=�6�   �� 55   
   -   5         ��Name$ quizScroller��55      $��0q�6-   $��1��68   $
��Auto=�6E   $��3��6h   .��56      �� -	   5         ��Name$ 	stackQuiz��56      $��2��6,   $��10,10,30,10q�6@   $��1��6U   $��1��6b   $
��Auto=�6r    �� CanVerticallyScroll . $��Center=�6�   ��6�   �� *ActualHeight+ �� ElementName$ RD_Quiz�� �� Mode$ OneWay=�57      58      5:      