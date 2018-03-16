z=tf('z',1/60)

GpH=[0.6547/(z-0.3998) 0 0.6547/(z-0.3998) 0;...
    -0.3749/(z-0.1599) 45.8247/(z-0.1599) 3.7493/(z-0.1599) 4.5825/(z-0.1599);...
    -55*0.6547/(z-0.3998) 0 -55*0.6547/(z-0.3998) 0]

%%%%
% In order to plot the results after simulation you should use Stairs
% command

stairs(t,y(:,2))


