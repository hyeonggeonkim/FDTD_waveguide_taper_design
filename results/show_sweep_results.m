%% EME Taper Results — Lumerical Postprocessing (Script)
close all; clear; clc;

%% --------------------- Global Plot Styling -------------------
set(groot,'defaultAxesFontSize',12);
set(groot,'defaultLineLineWidth',2);
set(groot,'defaultFigureColor','w');
set(groot,'defaultAxesBox','on');

MarkerSize = 8;

%% ===================== 1) Sinusoidal Wave ====================
% 1A. Sweep period (Number of periods vs Transmission)
period_sweep = safeRead('eme_taper_period_sweep_p1.txt');
if ~isempty(period_sweep)
    figure(1); clf; hold on; grid on;
    plot(period_sweep(:,1), period_sweep(:,2),'--rs', ...
        'MarkerSize',MarkerSize,'MarkerEdgeColor','r','MarkerFaceColor',[0.5 0.5 0.5]);
    xlabel('Number of periods','FontSize',15);
    ylabel('Transmission','FontSize',15);
    title('Sinusoidal taper: Period sweep');
    legend('Period sweep','Location','best');
    hold off;
end

% 1B. Sweep amplitude (Amplitude [µm] vs Transmission)
amp_sweep = safeRead('eme_taper_amp_sweep_16.txt');
if ~isempty(amp_sweep)
    figure(2); clf; hold on; grid on;
    plot(amp_sweep(:,1), amp_sweep(:,2),'--rs', ...
        'MarkerSize',MarkerSize,'MarkerEdgeColor','r','MarkerFaceColor',[0.5 0.5 0.5]);
    xlabel('Amplitude (\mum)','FontSize',15);
    ylabel('Transmission','FontSize',15);
    title('Sinusoidal taper: Amplitude sweep');
    xlim([0.1, 0.2]); % matches original choice
    legend('Amplitude sweep','Location','best');
    hold off;
end

% 1C. Optimization history (Generation vs Transmission)
opt_sinusoidal = safeRead('eme_taper_sinusoidal_optimization_curve.txt');
if ~isempty(opt_sinusoidal)
    figure(3); clf; grid on;
    plot(opt_sinusoidal(:,1), opt_sinusoidal(:,2),'-r');
    xlabel('Generation','FontSize',15);
    ylabel('Transmission','FontSize',15);
    title('Sinusoidal taper: Optimization history');
    legend('Optimization curve','Location','best');
end

%% ===================== 2) Exponential Wave ===================
% Exponential parameter sweep
exp_sweep = safeRead('eme_taper_exponential_n_exp_sweep.txt');
if ~isempty(exp_sweep)
    figure(4); clf; hold on; grid on;
    plot(exp_sweep(:,1), exp_sweep(:,2),'--gs', ...
        'MarkerSize',MarkerSize,'MarkerEdgeColor','g','MarkerFaceColor',[0.5 0.5 0.5]);
    xlabel('Exponential parameter','FontSize',15);
    ylabel('Transmission','FontSize',15);
    title('Exponential taper: Parameter sweep');
    legend('Exponential sweep','Location','best');
    hold off;
end

%% ========== 3) Best Results: Linear vs Sinusoidal vs Exponential ==========
% 3A. Taper length sweeps
taperL_linear      = safeRead('eme_taper_linear_best_result_group_span2.txt');
taperL_sinusoidal  = safeRead('eme_taper_sinusoidal_best_result_group_span2.txt');
taperL_exponential = safeRead('eme_taper_exponential_best_result_group_span2.txt');

if anyCellNotEmpty({taperL_linear, taperL_sinusoidal, taperL_exponential})
    figure(5); clf; hold on; grid on;
    legends = {};
    if ~isempty(taperL_linear)
        plot(taperL_linear(:,1), taperL_linear(:,2),'--bs', ...
            'MarkerSize',MarkerSize,'MarkerEdgeColor','b','MarkerFaceColor',[0.5 0.5 0.5]);
        legends{end+1} = 'Linear';
    end
    if ~isempty(taperL_sinusoidal)
        plot(taperL_sinusoidal(:,1), taperL_sinusoidal(:,2),'--rs', ...
            'MarkerSize',MarkerSize,'MarkerEdgeColor','r','MarkerFaceColor',[0.5 0.5 0.5]);
        legends{end+1} = 'Sinusoidal';
    end
    if ~isempty(taperL_exponential)
        plot(taperL_exponential(:,1), taperL_exponential(:,2),'--gs', ...
            'MarkerSize',MarkerSize,'MarkerEdgeColor','g','MarkerFaceColor',[0.5 0.5 0.5]);
        legends{end+1} = 'Exponential';
    end
    xlabel('taperL (m)','FontSize',15);
    ylabel('Transmission','FontSize',15);
    title('Best results by taper length');
    if ~isempty(legends), legend(legends,'Location','best'); end
    hold off;
end

% 3B. Wavelength sweeps
wavelength_linear      = safeRead('eme_taper_linear_best_result_wavenelght_1.5to1.6_sweep.txt');
wavelength_sinusoidal  = safeRead('eme_taper_sinusoidal_best_result_wavenelght_1.5to1.6_sweep.txt');
wavelength_exponential = safeRead('eme_taper_exponential_best_result_wavenelght_1.5to1.6_sweep.txt');

if anyCellNotEmpty({wavelength_linear, wavelength_sinusoidal, wavelength_exponential})
    figure(6); clf; hold on; grid on;
    legends = {};
    if ~isempty(wavelength_linear)
        plot(wavelength_linear(:,1), wavelength_linear(:,2),'--bs', ...
            'MarkerSize',MarkerSize,'MarkerEdgeColor','b','MarkerFaceColor',[0.5 0.5 0.5]);
        legends{end+1} = 'Linear';
    end
    if ~isempty(wavelength_sinusoidal)
        plot(wavelength_sinusoidal(:,1), wavelength_sinusoidal(:,2),'--rs', ...
            'MarkerSize',MarkerSize,'MarkerEdgeColor','r','MarkerFaceColor',[0.5 0.5 0.5]);
        legends{end+1} = 'Sinusoidal';
    end
    if ~isempty(wavelength_exponential)
        plot(wavelength_exponential(:,1), wavelength_exponential(:,2),'--gs', ...
            'MarkerSize',MarkerSize,'MarkerEdgeColor','g','MarkerFaceColor',[0.5 0.5 0.5]);
        legends{end+1} = 'Exponential';
    end
    xlabel('Wavelength (m)','FontSize',15);
    ylabel('Transmission','FontSize',15);
    title('Best results by wavelength');
    if ~isempty(legends), legend(legends,'Location','best'); end
    hold off;
end

%% ====================== Helper Functions ======================
function M = safeRead(fname)
% Read two-column text if present; warn otherwise.
if ~isfile(fname)
    warning('File not found: %s (skipping)', fname);
    M = [];
    return;
end
try
    M = readmatrix(fname);
    if size(M,2) < 2
        warning('File %s does not appear to be two-column. Read %d columns.', fname, size(M,2));
    end
catch ME
    warning('Failed to read %s: %s', fname, ME.message);
    M = [];
end
end

function tf = anyCellNotEmpty(C)
tf = any(cellfun(@(x)~isempty(x), C));
end
