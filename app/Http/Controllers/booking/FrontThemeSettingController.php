<?php

namespace App\Http\Controllers\Admin;

use App\FrontThemeSetting;
use App\Helper\Files;
use App\Helper\Reply;
use App\Http\Requests\FrontTheme\StoreImagesRequest;
use App\Http\Requests\FrontTheme\StoreTheme;
use App\Media;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\FrontTheme\StoreSeoRequest;
use Illuminate\Support\Facades\File;

class FrontThemeSettingController extends Controller
{

    public function update(StoreTheme $request, $id){
        $theme = FrontThemeSetting::first();

        $theme->primary_color = $request->primary_color;
        $theme->secondary_color = $request->secondary_color;
        $theme->custom_css = $request->front_custom_css;

        if ($request->hasFile('front_logo')) {
            $theme->logo = Files::upload($request->front_logo,'front-logo');
        }

        $theme->save();

        return Reply::success(__('messages.updatedSuccessfully'));
    }

    public function store(StoreImagesRequest $request) {
        if (sizeof($request->images) == 0) {
            return;
        }

        foreach ($request->images as $image) {
            $media = new Media();
            $media->file_name = Files::upload($image,'carousel-images');
            $media->save();
        }

        $images = Media::select('id', 'file_name')->latest()->get();
        $view = view('partials.carousel_images', compact('images'))->render();

        return Reply::successWithData(__('messages.imageUploadedSuccessfully'), ['view' => $view]);
    }

    public function destroy(Request $request, $id) {
        $req_image = Media::select('id', 'file_name')->where('id', $id)->first();

        if($req_image) {
            Files::deleteFile($req_image->file_name,'carousel-images');
            $req_image->delete();
        }

        $images = Media::select('id', 'file_name')->latest()->get();

        $view = view('partials.carousel_images', compact('images'))->render();

        return Reply::successWithData(__('messages.imageDeletedSuccessfully'), ['view' => $view]);
    }

    public function changeCarouselStatus()
    {
        $front_theme_setting = FrontThemeSetting::first();
        $front_theme_setting->carousel_status = request()->carousel_status;
        $front_theme_setting->save();

        return Reply::success(__('messages.settingUpdated'));
    }

    public function addSeoDetails(StoreSeoRequest $request)
    {
        $seo = FrontThemeSetting::first();
        $seo->seo_description = $request->seo_description;
        $seo->seo_keywords = $request->seo_keywords;
        $seo->save();

        return Reply::success(__('messages.updatedSuccessfully'));
    }
}
