% this script visualizes U and V
[U, V, ~, ~, ~] = READ_UV();
% movie_all = read_movie('movies.txt');
[movieID,movieName,movieGenre,Genres] = read_movie('movies.txt');
%%
% first let's find the most popular movies, and add a column to movie_all
% to record them
[userID, movieID_in_rating, rate] = read_data('data.txt');
movie_frequency = tabulate(movieID_in_rating);
movie_all = [movieID movie_frequency(:, 2)];
[~, sorted_order] = sort(movie_frequency(:, 2), 'descend');
% movie_sort_by_frequency = sort(movie_all, 2)
fid = fopen('popular.txt','a');
for idx = 1:500
    movie_id = movieID(idx);
    movie_name = movieName(idx);
    fprintf(fid,'%d ', movie_id);
    fprintf(fid, '%s', movie_name);
    fprintf(fid,'\n');
end
fclose(fid);





%%
[A, ~, ~] = svd(U, V);
V_tilde = t(A(:, 1:2)) * V;
U_tilde = t(A(:, 1:2)) * U;