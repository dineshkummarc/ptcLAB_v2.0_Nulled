@extends($activeTemplate . 'layouts.master')
@section('content')
    <section class="cmn-section">
        <div class="container">
            <div class="row gy-4 justify-content-center">
                @if (!blank($ads))
                    @foreach ($ads as $ad)
                        @if ($ad->schedule)
                            @php
                                $currentTime = now()->format('H:i');
                            @endphp

                            @if (!collect($ad->schedule)->where('day', strtolower(now()->format('l')))->where('start', '<', $currentTime)->where('end', '>', $currentTime)->first())
                                @continue
                            @endif
                        @endif

                        <div class="col-xl-4 col-md-6">
                            <div class="card custom--card ptc-card ">
                                <div class="card-body p-4">
                                    <div class="row align-items-center">
                                        <div class="col-8">
                                            <h6>{{ __($ad->title) }}</h6>
                                            <span class="fs--14px mt-2">@lang('Ads duration') : {{ $ad->duration }}s</span>
                                        </div>
                                        <div class="col-4 text-end">
                                            <h5 class="text--base">{{ showAmount($ad->amount) }}</h5>
                                            <a href="{{ route('user.ptc.show', encrypt($ad->id . '|' . auth()->user()->id)) }}"
                                                target="_blank"
                                                class="btn fs--12px px-sm-3 px-2 py-1 btn--base mt-2">@lang('View Ad')</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                @else
                <div class="card">
                        <div class="card-body p-0">
                            @include($activeTemplate . 'partials.empty', ['message' => 'PTC ad not found'])
                        </div>
                    </div>
                @endif
            </div>

        </div>
    </section>
@endsection
