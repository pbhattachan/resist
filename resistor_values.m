%% Figure out location of all photos
img_dir = 'C:\Users\presi\OneDrive\Documents\UW\BME\Co-op\Coop Spring 2018\resistor\';

good_photos = 'C:\Users\presi\OneDrive\Documents\UW\BME\Co-op\Coop Spring 2018\resistor\resistor\';
bad_photos =  'C:\Users\presi\OneDrive\Documents\UW\BME\Co-op\Coop Spring 2018\resistor\meme\';

%% Display the image set

imgSet = imageSet(img_dir, 'recursive');

disp(['Your image set contains' num2str(sum(imgSet.Count)), ...
    'images from ' num2str(numel(imgSet)) ' classes']);

imageSetViewer(imgSet);

%% Bag of Features
bag = bagOfFeatures(imgSet,'VocabularySize',1000);

%% Visualize Feature Vectors
togglefig('Encoding', true)
for ii = 1:numel(imgSet)
    img = read(imgSet(ii),randi(imgSet(ii).Count));
    featureVector = encode(bag,img);
    subplot(numel(imgSet),2,ii*2-1);
    imshow(img);
    title(imgSet(ii).Description);
    subplot(numel(imgSet),2,ii*2);
    bar(featureVector);
    set(gca,'xlim', [0 bag.VocabularySize]);
    title('Visual Word Occurances');
    if ii == numel(imgSet)
        xlabel('Visual Word Index');
    end
    if ii == floor(numel(imgSet)/2)
        ylabel('Frequence of occurrence');
    end
end

%% Then we encode it as histograms of features, and cast it to a table
% (This is useful for working with the classficationLearner app)
resistorData = double(encode(bag, imgSet));
resistorImageData = array2table(infectionData);
resistorType = categorical(repelem({imgSet.Description}', [imgSet.Count], 1));
%%

% good_pictures = dir(strcat(good_photos,'*.jpg'));
% bad_pictures = dir(strcat(bad_photos,'*.jpg'));
% 
% for i= 1:length(good_pictures)
%     bruh = imread(strcat(good_photos,good_pictures(i).name));
% end

