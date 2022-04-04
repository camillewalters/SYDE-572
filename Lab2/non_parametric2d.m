function non_parametric2d(a,b,c)
% From parzen.m: 
% [p,x,y] = parzen( data, res, win )    
%
%  data - two-column matrix of (x,y) points
%         (third row/col optional point frequency)
%  res  - resolution (step size)
%         optionally [res lowx lowy highx highy]
%  win  - optional, gives form of window 
%          if a scalar - radius of square window
%          if a vector - radially symmetric window
%          if a matrix - actual 2D window shape
%
%  x    - locations along x-axis
%  y    - locations along y-axis
%  p    - estimated 2D PDF


% Use a Gaussian Parzen window (σ2 = 400) on the learning data to
% estimate a PDF for each cluster. 

% Apply an ML classifier to the esti% mated PDFs 


% plot the classification boundaries together with the
% cluster data.


end