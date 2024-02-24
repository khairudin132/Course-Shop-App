<?php

namespace App\Models;

use Encore\Admin\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Lesson extends Model
{
    use HasFactory;
    use DefaultDatetimeFormat;

    protected $casts = [
        'video' => 'json',
    ];

    public function getThumbnailAttribute($value)
    {
        if ($value) {
            return secure_asset('uploads/' . $value);
        }

        return null;
    }

    public function setVideoAttribute($value)
    {
        //the below method json_encode converts the object to json from array
        /*
            'a'=>'val1',
            'b'=>'val2',
            .....
            'a':'val1',
            'b':'val2',
        */

        $this->attributes['video'] = json_encode(array_values($value));
    }

    public function getVideoAttribute($value)
    {
        // Decode the JSON string into an array
        $decodedArray = json_decode($value, true);
    
        // Check if decoding was successful and not null or false
        if ($decodedArray) {
            // Convert the array into a collection
            $collection = collect($decodedArray);
    
            // Use the transform method on the collection
            $collection->transform(function ($video) {
                if (!empty($video['url'])) { // Note that we use array access here
                    $video['url'] = secure_asset('uploads/' . $video['url']);
                }
                if (!empty($video['thumbnail'])) {
                    $video['thumbnail'] = secure_asset('uploads/' . $video['thumbnail']);
                }
                return $video;
            });
    
            // Return the transformed collection as an array
            return $collection->toArray();
        }
    
        // Return an empty array if the decoded value was null or false
        return [];
    }
}
