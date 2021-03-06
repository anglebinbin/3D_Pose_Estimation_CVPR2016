function [ scale, dataReal, thresh1, thresh2, dataBool ] = getRealFeature6( mot )

scale = true;
threshold_vel1 = 1.3;
threshold_vel2 = 1.8;
win_length_ms1 = 250;

humerus_length = sqrt(sum((mot.jointTrajectories{trajectoryID(mot,'lshoulder')}(:,1) - mot.jointTrajectories{trajectoryID(mot,'lelbow')}(:,1)).^2));

dataReal = feature_velRelPointNormalPlane( mot, 'chest', 'neck', 'neck', 'lwrist', win_length_ms1 );
thresh1 = threshold_vel1 * humerus_length;
thresh2 = threshold_vel2 * humerus_length;

if nargout > 4
    dataBool = feature_AK_bool_handLeftToTopRelSpine_robust(mot);
end